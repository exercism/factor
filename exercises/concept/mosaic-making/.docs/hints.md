# Hints

## General

- `1array`, `2array`, `3array` build a fixed-length array out of
  the top stack values.
- `concat` flattens a sequence-of-sequences by one level.
- `reverse`, `index`, and `member?` are protocol words from
  [`sequences`][sequences] that work on any sequence — including
  arrays of strings.

## 5. Tile position

- `index` takes the *element first* and the *sequence second*,
  and returns either the index or `f`. The task hands you the
  arguments in the opposite order — a `swap` away.

## 6. Has colour?

- `member?` takes the *element first* and the *sequence second*,
  and returns a boolean directly.

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
