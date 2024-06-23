package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"strconv"
	"time"

	"github.com/labstack/echo/v5"
	"github.com/pocketbase/pocketbase"
	"github.com/pocketbase/pocketbase/apis"
	"github.com/pocketbase/pocketbase/core"
	"github.com/pocketbase/pocketbase/plugins/ghupdate"
	"github.com/pocketbase/pocketbase/plugins/jsvm"
	"github.com/pocketbase/pocketbase/plugins/migratecmd"
	"github.com/rodydavis/flutter-pocketbase-sync/hooks"
)

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
		hooks.SetupSyncService(e, app)
		e.Router.File("/assets/sqlite3.wasm", "web/sqlite3.wasm", crossOriginHeaders)
		e.Router.File("/assets/sqlite3.debug.wasm", "web/sqlite3.debug.wasm", crossOriginHeaders)
		app.OnFileDownloadRequest().Add(func(e *core.FileDownloadEvent) error {
			e.HttpContext.Response().Header().Set("Cache-Control", "public, max-age=31536000, immutable")
			return nil
		})
		count := 0
		e.Router.GET("/test", func(c echo.Context) error {
			count += 1
			app.Logger().Info("Count: " + fmt.Sprint(count))
			return c.JSON(http.StatusOK, map[string]string{"count": fmt.Sprint(count)})
		}, defaultCacheHeaders)
		return nil
	})

	if err := app.Start(); err != nil {
		log.Fatal(err)
	}
}

func crossOriginHeaders(next echo.HandlerFunc) echo.HandlerFunc {
	return func(c echo.Context) error {
		c.Response().Header().Set("Cross-Origin-Opener-Policy", "same-origin")
		c.Response().Header().Set("Cross-Origin-Embedder-Policy", "credentialless")

		if err := next(c); err != nil {
			c.Error(err)
		}
		return nil
	}
}

func defaultCacheHeaders(next echo.HandlerFunc) echo.HandlerFunc {
	return func(c echo.Context) error {
		// c.Response().Header().Set("Cache-Control", "public, max-age=3600, stale-while-revalidate=86400")
		c.Response().Header().Set("Cache-Control", "public, max-age=1, stale-while-revalidate=59")

		if err := next(c); err != nil {
			c.Error(err)
		}
		return nil
	}
}
