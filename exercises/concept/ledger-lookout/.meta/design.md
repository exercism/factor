# Design

## Goal

Build on the basic `regexp` exercise (`passphrase-patrol`) with the
features of regular expressions that describe structure and context:
grouping, alternation, anchors, lookaround, and pattern options. The
audience already knows character classes, quantifiers, and the basic
matching words.

## Learning objectives

- Group part of a pattern with `( )` so a quantifier or `|` applies to
  the whole group, including making a group optional with `?`.
- Use alternation `|` to match one of several alternatives.
- Match by surrounding context with lookahead `(?=...)`, negative
  lookahead `(?!...)`, and lookbehind `(?<=...)` — zero-width
  assertions that are not part of the result.
- Change matching behaviour with an option letter, e.g. `R/ .../i` for
  case-insensitive matching.

## Out of scope

- Capture-group *extraction* and back-references, which Factor's
  `regexp` does not support — lookaround is the substitute taught here.
- Lazy/non-greedy quantifiers (`*?`, `+?`), which Factor does not
  support.
- Building a regex from a runtime string with `<regexp>`.
- Other option letters and the lower-level match-iterator words
  (`each-match`, `map-matches`).

## Concepts

- `advanced-regexp`.

## Prerequisites

- `regexp` — the basic character classes, quantifiers, and matching
  words this exercise builds on.
- `sequences` — `dollar-amounts` and `percentages` return sequences.
