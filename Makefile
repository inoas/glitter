.PHONY: dev

.DEFAULT_GOAL:= dist

dist:
	rm -rf dist
	gleam build
	npx vite build

dev:
	npx concurrently \
		vite \
		"watchexec --filter 'src/**' --no-shell --postpone --watch-when-idle -- sh -c 'gleam build --target javascript'"
