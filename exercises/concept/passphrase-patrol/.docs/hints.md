# Hints

## General

- `matches?`, `all-matching-subseqs`, `count-matches`, and
  `re-replace` all live in [`regexp`][regexp]. Write each pattern as a
  literal between `R/ ` and `/`.
- A valid badge code is two capitals, a dash, four digits:
  `R/ [A-Z]{2}-\d{4}/`.

## 1. Check a badge code

- `matches?` tests the *whole* string, which is exactly what "is this a
  valid badge code?" needs: `R/ [A-Z]{2}-\d{4}/ matches?`.

## 2. Pull every code out of a log line

- `all-matching-subseqs` returns every match as a sequence of strings —
  hand it the same badge-code pattern.

## 3. Count the digits in a code

- `\d` matches one digit; `count-matches` counts how many times the
  pattern matches: `R/ \d/ count-matches`.

## 4. Redact passwords

- `\S` means "a non-space character", so `R/ pass=\S+/` matches `pass=`
  plus the secret after it.
- `re-replace` takes the string, the pattern, and the replacement text
  `"pass=****"`.

[regexp]: https://docs.factorcode.org/content/vocab-regexp.html
