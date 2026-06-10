# Hints

## General

- Every reading and writing word lives in [`io.files`][io.files]; the `utf8`
  encoding they all take comes from [`io.encodings.utf8`][utf8].

## 1. Read every reading

- `file-lines` returns an array of lines with the newlines removed.

## 2. Find the latest reading

- Read the lines with `file-lines`, then take the `last` one (from
  `sequences`).

## 3. Read the raw log

- `file-contents` returns the file as a single string, newlines and all.

## 4. Record a reading

- Open the file for appending and `print` the reading inside the quotation:
  `with-file-appender ( path encoding quot -- )`. The reading is used inside
  the quotation while the path is consumed before it, so `::` locals keep the
  body readable:
  `:: record-reading ( reading path -- ) path utf8 [ reading print ]
  with-file-appender ;`.

## 5. Rewrite the log

- `set-file-lines` writes each element of a sequence on its own line, adding
  the newlines for you.

[io.files]: https://docs.factorcode.org/content/vocab-io.files.html
[utf8]: https://docs.factorcode.org/content/vocab-io.encodings.utf8.html
