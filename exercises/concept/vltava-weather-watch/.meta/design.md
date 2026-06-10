# Design

## Goal

Teach reading from and writing to real files on disk with `io.files`, building
directly on the stream story from `channel-chatter`. The student has already
read from and written to in-memory string streams; here those same operations
land on named files via the whole-file convenience words and a `with-…`
appender.

## Learning objectives

- Read a whole file with `file-contents` and as lines with `file-lines`.
- Replace a file's contents with `set-file-contents` / `set-file-lines`.
- Append to a file with `with-file-appender`, writing to the ambient stream.
- Pass the `utf8` encoding (from `io.encodings.utf8`) to every file word.
- Recognise `with-file-reader` / `with-file-writer` / `with-file-appender` as
  the same destructor-scoped `with-…` family seen in `channel-chatter`.

## Out of scope

- Implementing the stream protocol — that is `telegraphers-tape`.
- Incremental reading (`stream-read`, `stream-readln`) — covered as a protocol
  in the stream exercises; this exercise stays with whole-file words plus an
  appender.
- Paths, globbing, directory traversal, and file metadata (`io.pathnames`,
  `io.directories`).
- Encodings beyond `utf8`.

## Concepts

- `files`: whole-file reading (`file-contents`, `file-lines`), whole-file
  writing (`set-file-contents`, `set-file-lines`), and appending with
  `with-file-appender`, all parameterised by an encoding.

## Prerequisites

- `io-streams` — taught in `channel-chatter`. Files are streams; the `with-…`
  appender writes to the ambient output exactly like the string-writer tasks.
- `sequences` — taught in `backyard-birdwatcher`. `file-lines` returns an
  array; `last` (task 2) consumes it and `set-file-lines` writes one back.
- `strings` — taught in `log-levels`. Readings and log contents are strings.

## Tasks ramp

1. **`read-readings`** — `file-lines`. The first read, line-oriented.
2. **`latest-reading`** — `file-lines last`. Picks a line out of the array,
   reusing the sequence skills from the prerequisite.
3. **`log-text`** — `file-contents`. The whole-file string form, contrasted
   with the line form.
4. **`record-reading`** — `with-file-appender` with `print`. First write; the
   `with-…` scope and ambient output mirror `channel-chatter`'s `broadcast`.
5. **`rewrite-log`** — `set-file-lines`. Replaces the file wholesale, the
   inverse of task 1.

## Why a single log file in tests

Each test rewrites `weather.log` in the working directory with
`set-file-contents` before exercising a word, and the write tasks read the file
back to confirm the change. Reusing one fixed filename keeps the tests
self-contained and deterministic — no temp-path juggling — while still hitting
the real on-disk code path.
