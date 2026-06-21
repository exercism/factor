# Hints

## General

- Everything here is in [`regexp`][regexp], written with `R/ /`.
- A group is `( ... )`; `|` is "or"; lookaround is `(?=...)`,
  `(?!...)`, and `(?<=...)`.

## 1. Validate an amount

- Make the cents part a group and mark it optional: `(\.\d{2})?`.
- Write `\$` for a literal dollar sign, then use `matches?` to require
  the *whole* string to fit: `R/ \$\d+(\.\d{2})?/ matches?`.

## 2. Pull out the dollar figures

- A *lookbehind* matches digits only when a `$` comes first, without
  including the `$`: `R/ (?<=\$)\d+/`.
- `all-matching-subseqs` collects every such match.

## 3. Pull out the percentages

- A *lookahead* matches digits only when a `%` comes next:
  `R/ \d+(?=%)/`.

## 4. Flag a line

- Use `|` for the two words and the `i` option for case-insensitivity:
  `R/ refund|chargeback/i`.
- `re-contains?` reports whether the line matches anywhere.

[regexp]: https://docs.factorcode.org/content/vocab-regexp.html
