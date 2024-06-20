package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
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
	"github.com/pocketbase/pocketbase/plugins/ghupdate"
	"github.com/pocketbase/pocketbase/plugins/jsvm"
	"github.com/pocketbase/pocketbase/plugins/migratecmd"
	"github.com/pocketbase/pocketbase/tools/cron"
)

const ModifiedRecordsCollection = "changes"

func main() {
	app := pocketbase.New()

	var hooksDir string = os.Getenv("PB_HOOKS_DIR")
	var hooksWatch bool = true
	var hooksPool int = 25
	var migrationsDir string
	var automigrate bool = true
	var publicDir string = "./pb_public"
	var indexFallback bool = true
	var queryTimeout int = 30

	if os.Getenv("PB_HOOKS_DIR") != "" {
		hooksDir = os.Getenv("PB_HOOKS_DIR")
	}

	if os.Getenv("PB_HOOKS_WATCH") != "" {
		value, err := strconv.ParseBool(os.Getenv("PB_HOOKS_WATCH"))
		if err != nil {
			hooksWatch = value
		}
	}

	if os.Getenv("PB_HOOKS_POOL") != "" {
		value, err := strconv.Atoi(os.Getenv("PB_HOOKS_POOL"))
		if err == nil {
			hooksPool = value
		}
	}

	if os.Getenv("PB_AUTO_MIGRATE") != "" {
		value, err := strconv.ParseBool(os.Getenv("PB_AUTO_MIGRATE"))
		if err != nil {
			automigrate = value
		}
	}

	if os.Getenv("PB_PUBLIC_DIR") != "" {
		publicDir = os.Getenv("PB_PUBLIC_DIR")
	}

	if os.Getenv("PB_INDEX_FALLBACK") != "" {
		value, err := strconv.ParseBool(os.Getenv("PB_INDEX_FALLBACK"))
		if err != nil {
			indexFallback = value
		}
	}

	if os.Getenv("PB_QUERY_TIMEOUT") != "" {
		value, err := strconv.Atoi(os.Getenv("PB_QUERY_TIMEOUT"))
		if err == nil {
			queryTimeout = value
		}
	}

	jsvm.MustRegister(app, jsvm.Config{
		MigrationsDir: migrationsDir,
		HooksDir:      hooksDir,
		HooksWatch:    hooksWatch,
		HooksPoolSize: hooksPool,
	})

	migratecmd.MustRegister(app, app.RootCmd, migratecmd.Config{
		TemplateLang: migratecmd.TemplateLangJS,
		Automigrate:  automigrate,
		Dir:          migrationsDir,
	})

	ghupdate.MustRegister(app, app.RootCmd, ghupdate.Config{})

	app.OnAfterBootstrap().PreAdd(func(e *core.BootstrapEvent) error {
		app.Dao().ModelQueryTimeout = time.Duration(queryTimeout) * time.Second
		return nil
	})

	// serves static files from the provided public dir (if exists)
	app.OnBeforeServe().Add(func(e *core.ServeEvent) error {
		e.Router.GET("/*", apis.StaticDirectoryHandler(os.DirFS(publicDir), indexFallback))

		scheduler := cron.New()
		scheduler.MustAdd("remove-old-deleted", "@daily", func() {
			removeOldDeletedRecords(e, 90)
		})
		scheduler.Start()

		app.OnRecordAfterCreateRequest().Add(func(e *core.RecordCreateEvent) error {
			return addModelTracker(app, "create", e.Collection, e.Record)
		})

		app.OnRecordBeforeUpdateRequest().Add(func(e *core.RecordUpdateEvent) error {
			return addModelTracker(app, "update", e.Collection, e.Record)
		})

		app.OnRecordBeforeDeleteRequest().Add(func(e *core.RecordDeleteEvent) error {
			return addModelTracker(app, "delete", e.Collection, e.Record)
		})

		e.Router.DELETE("/api/remove-deleted-records", func(c echo.Context) error {
			query := e.App.Dao().
				RecordQuery(ModifiedRecordsCollection)

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

	if err := app.Start(); err != nil {
		log.Fatal(err)
	}
}

func addModelTracker(
	app *pocketbase.PocketBase,
	method string,
	Collection *models.Collection,
	Record *models.Record,
) error {
	CollectionName := ModifiedRecordsCollection

	excludedCollections := []string{
		CollectionName,
		ModifiedRecordsCollection,
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
	query := e.App.Dao().RecordQuery(ModifiedRecordsCollection).
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
