package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
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

const DeletedRecordsCollection = "deleted_records"

func main() {
	app := pocketbase.New()

	// serves static files from the provided public dir (if exists)
	app.OnBeforeServe().Add(func(e *core.ServeEvent) error {
		e.Router.GET("/*", apis.StaticDirectoryHandler(os.DirFS("./pb_public"), false))

		scheduler := cron.New()
		scheduler.MustAdd("remove-old-deleted", "@daily", func() {
			removeOldDeletedRecords(e, 90)
		})
		scheduler.Start()

		collections := []*models.Collection{}
		userCollections := []*models.Collection{}
		collectionsQuery := app.Dao().CollectionQuery()
		if err := collectionsQuery.All(&collections); err != nil {
			fmt.Print(err)
			return nil
		}

		for _, col := range collections {
			if strings.HasPrefix(col.Name, "user_") {
				userCollections = append(userCollections, col)
			}
		}

		app.OnRecordAfterCreateRequest().Add(func(e *core.RecordCreateEvent) error {
			if !isUserCollection(userCollections, e.Collection) {
				return nil
			}
			return addUserActivityTracker(app, "create", e.Collection, e.Record)
		})

		app.OnRecordAfterUpdateRequest().Add(func(e *core.RecordUpdateEvent) error {
			if !isUserCollection(userCollections, e.Collection) {
				return nil
			}
			return addUserActivityTracker(app, "update", e.Collection, e.Record)
		})

		app.OnRecordAfterDeleteRequest().Add(func(e *core.RecordDeleteEvent) error {
			if !isUserCollection(userCollections, e.Collection) {
				return nil
			}
			return addUserActivityTracker(app, "delete", e.Collection, e.Record)
		})

		e.Router.DELETE("/api/remove-deleted-records", func(c echo.Context) error {
			query := e.App.Dao().RecordQuery(DeletedRecordsCollection)

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

		return nil
	})

	// Helper hook that keeps a record of the deleted data as an alternative to soft deletes
	// Inspiration: https://brandur.org/fragments/deleted-record-insert
	app.OnRecordBeforeDeleteRequest().Add(func(e *core.RecordDeleteEvent) error {
		CollectionName := DeletedRecordsCollection

		// Add other collection names here where you don't want to keep a copy of the deleted record
		excludedCollections := []string{
			CollectionName,
		}

		// Skip if the record is already deleted or in excluded collections
		if slices.Contains(excludedCollections, e.Collection.Name) {
			return nil
		}

		collection, err := app.Dao().FindCollectionByNameOrId(CollectionName)
		if err != nil {
			return err
		}

		record := models.NewRecord(collection)

		form := forms.NewRecordUpsert(app, record)
		form.LoadData(map[string]any{
			"collection_id": e.Collection.Id,
			"record_id":     e.Record.Id,
			"record_data":   e.Record,
		})

		return form.Submit()
	})

	if err := app.Start(); err != nil {
		log.Fatal(err)
	}
}

func isUserCollection(collections []*models.Collection, collection *models.Collection) bool {
	for _, col := range collections {
		if col.Id == collection.Id {
			return true
		}
	}
	return false
}

func addUserActivityTracker(
	app *pocketbase.PocketBase,
	method string,
	Collection *models.Collection,
	Record *models.Record,
) error {
	CollectionName := "user_activity"

	excludedCollections := []string{
		CollectionName,
		DeletedRecordsCollection,
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

	form := forms.NewRecordUpsert(app, record)
	form.LoadData(map[string]any{
		"user_id":       Record.GetString("user_id"),
		"collection_id": Record.GetString("collection_id"),
		"record_id":     Record.Id,
		"record_data":   Record,
		"type":          method,
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
	query := e.App.Dao().RecordQuery(DeletedRecordsCollection).
		AndWhere(dbx.NewExp("updated = {:date}", dbx.Params{"date": date}))
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
