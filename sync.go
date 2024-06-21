package main

import (
	"fmt"
	"net/http"
	"time"

	"golang.org/x/exp/slices"

	"github.com/labstack/echo/v5"
	"github.com/pocketbase/dbx"
	"github.com/pocketbase/pocketbase"
	"github.com/pocketbase/pocketbase/apis"
	"github.com/pocketbase/pocketbase/core"
	"github.com/pocketbase/pocketbase/daos"
	"github.com/pocketbase/pocketbase/forms"
	"github.com/pocketbase/pocketbase/models"
	"github.com/pocketbase/pocketbase/tools/cron"
)

const modifiedRecordsCollection = "changes"

func SetupSyncService(e *core.ServeEvent, app *pocketbase.PocketBase) {
	scheduler := cron.New()
	scheduler.MustAdd("remove-old-deleted", "@daily", func() {
		removeOldDeletedRecords(e, 90)
	})
	scheduler.Start()

	// Optionally track creates
	app.OnRecordAfterCreateRequest().Add(func(e *core.RecordCreateEvent) error {
		return addModelTracker(app, "create", e.Collection, e.Record)
	})

	// Optionally track updates
	app.OnRecordBeforeUpdateRequest().Add(func(e *core.RecordUpdateEvent) error {
		return addModelTracker(app, "update", e.Collection, e.Record)
	})

	// Required track deletes
	app.OnRecordBeforeDeleteRequest().Add(func(e *core.RecordDeleteEvent) error {
		return addModelTracker(app, "delete", e.Collection, e.Record)
	})

	e.Router.DELETE("/api/remove-deleted-records", func(c echo.Context) error {
		query := e.App.Dao().
			RecordQuery(modifiedRecordsCollection)

		records := []*models.Record{}
		if err := query.All(&records); err != nil {
			return nil
		}

		for _, record := range records {
			if err := app.Dao().DeleteRecord(record); err != nil {
				return err
			}
		}

		return c.JSON(http.StatusOK, records)
	}, apis.RequireAdminAuth())
}

func addModelTracker(
	app *pocketbase.PocketBase,
	method string,
	Collection *models.Collection,
	Record *models.Record,
) error {
	CollectionName := modifiedRecordsCollection

	excludedCollections := []string{
		CollectionName,
		modifiedRecordsCollection,
	}

	if slices.Contains(excludedCollections, Collection.Name) {
		return nil
	}

	collection, err := app.Dao().FindCollectionByNameOrId(CollectionName)
	if err != nil {
		return err
	}

	if collection.Type != models.CollectionTypeBase {
		return nil
	}

	record := models.NewRecord(collection)

	// if method == "update" {
	// 	current, err := app.Dao().FindRecordById(Collection.Id, Record.Id)
	// 	if err != nil {
	// 		return err
	// 	}
	// 	// TODO: Delta changes
	// }

	form := forms.NewRecordUpsert(app, record)
	form.LoadData(map[string]any{
		"collection_id":   Collection.Id,
		"collection_name": Collection.Name,
		"record_id":       Record.Id,
		"record_data":     Record,
		"action":          method,
	})

	return form.Submit()
}

func removeOldDeletedRecords(e *core.ServeEvent, days int) {
	t := time.Now().UTC()
	if days > 0 {
		t = t.AddDate(0, 0, -1*days)
	}
	date := fmt.Sprintf("%d-%02d-%02d", t.Year(), t.Month(), t.Day())

	records := []*models.Record{}
	query := e.App.Dao().RecordQuery(modifiedRecordsCollection).
		AndWhere(dbx.NewExp("updated < {:date}", dbx.Params{"date": date}))
	if err := query.All(&records); err != nil {
		e.App.Logger().Error("Could not fetch deleted records", err)
		return
	}

	e.App.Logger().Info("Deleting old records: " + fmt.Sprint(len(records)))

	e.App.Dao().RunInTransaction(func(txDao *daos.Dao) error {
		for _, record := range records {
			if err := txDao.DeleteRecord(record); err != nil {
				e.App.Logger().Error("Failed to delete record", err, record)
			}
		}
		return nil
	})
}
