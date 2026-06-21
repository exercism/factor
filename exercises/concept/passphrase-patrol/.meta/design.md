# Design

## Goal

Introduce Factor's `regexp` vocabulary to a student who has never used
a regular expression before: writing a pattern with `R/ /` and using
it to validate, search, count, and replace text.

## Learning objectives

- Write a regex literal with `R/ /`, using character classes (`\d`,
  `\s`, `\S`, `[A-Z]`) and quantifiers (`{n}`, `+`, `*`, `?`).
- Test whether a *whole* string fits a pattern with `matches?`.
- Collect every match inside a string with `all-matching-subseqs`, and
  count matches with `count-matches`.
- Substitute every match with `re-replace`.

## Out of scope

- Capture groups and back-references.
- `first-match` and `re-split`, which return `slice` objects, and the
  slice-vs-string coercion that comes with them.
- Regex options/flags, alternation, lookahead, and anchors beyond
  whole-string matching.
- Building a regex at runtime with `<regexp>`.

## Concepts

- `regexp`.

## Prerequisites

- `strings` — the data being matched lives in strings.
- `sequences` — `badge-codes` returns a sequence of matches.
