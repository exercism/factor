# Design

## Goal

Introduce Factor's `unicode` vocabulary: character predicates
(`LETTER?`, `letter?`, `Letter?`, `digit?`) and single-character
case conversion (`ch>upper`, `ch>lower`).

## Learning objectives

- Recognise that Factor characters are integers (Unicode code
  points) and can be compared numerically.
- Use Unicode-aware predicates to classify a character.
- Convert a character's case with `ch>upper` / `ch>lower`.

## Out of scope

- String-level case conversion (`>upper` / `>lower`).
- Grapheme clustering and normalisation forms (NFC/NFD/NFKC/NFKD).
- Locale-specific behaviour and collation.

## Concepts

- `unicode`

## Prerequisites

- `strings`
- `conditionals`
