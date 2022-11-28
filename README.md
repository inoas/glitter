# Glitter

[![Package Version](https://img.shields.io/hexpm/v/glitter)](https://hex.pm/packages/glitter)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/glitter/)

A Gleam project

## Usage

If available on Hex this package can be added to your Gleam project:

```sh
gleam add glitter
```

and its documentation can be found at <https://hexdocs.pm/glitter>.

## Library Development

This uses Lustre and thus [watchexec](https://github.com/watchexec/watchexec) to rebuild the Gleam project on save.

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
