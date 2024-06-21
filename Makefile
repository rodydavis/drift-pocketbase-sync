dev:
	go run . serve
generate:
	dart --define=ADMIN_USERNAME="admin@email.com" --define=ADMIN_PASSWORD="admin123456" --define=PB_URL="http://127.0.0.1:8090" ./bin/generate.dart
	dart run build_runner build --delete-conflicting-outputs
build_macos: generate
	flutter build macos
build_ios: generate
	flutter build ios
build_android: generate
	flutter build appbundle
build_windows: generate
	flutter build windows
build_linux: generate
	flutter build linux
build_web: generate
	flutter build web --output=./pb_public
build_server:
	go build -o server.exe main.go
	chmod +x server.exe
build:	build_web
	make build_server
