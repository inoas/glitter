# lustre_counter

This uses Lustre and thus [watchexec](https://github.com/watchexec/watchexec) to rebuild the Gleam project on save.

## Quick start

Initial setup:

```sh
npm install
gleam build
```

Run dev server on `localhost:3000`:

```sh
make dev
```

Make a production build under `dist` folder:

```sh
make
```
