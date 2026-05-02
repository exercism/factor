# Design

## Goal

Teach **defining new words and organizing them across
vocabularies** — the namesake practice of Factor. The student
splits the solution across two files, putting small reusable
pieces into a helpers vocabulary and composing them in the main
vocabulary.

## Concept introduced

`vocabularies` — declaring a vocabulary with `IN:`, importing
others with `USING:`, and the directory-layout convention that
ties vocabulary names to file paths.

## Prerequisite concepts

- `stack-effect` — basic word definition syntax (`: ;`)
- `strings` — the helpers and main both work with strings
- `sequences` — `map`, array literals
- `higher-order-sequences` — `[ word ] map` pattern
- `locals` — `::` makes the briefing definition cleaner

## Why two files

Concept exercises elsewhere on the track teach single-file Factor.
This is the first place a student sees code split across vocabs.
The split is *meaningful*, not cosmetic: each helper is a
single-purpose word that the main file composes, so the file
boundary tracks the conceptual boundary.

The student edits both files. The exercise's `.meta/config.json`
lists both files in `solution` and `exemplar` arrays;
`bin/verify-exercises` zips them index-wise via `transpose` and
copies pairwise.

## Tasks ramp

1. `greeting` (helpers) — first word definition; just a literal.
2. `crew-line` (helpers) — adds string concatenation via
   `prepend`.
3. `closing` (helpers) — same shape as `greeting`; reinforces
   the simplest pattern.
4. `roster` (main) — first task in the main file; introduces
   `USING: bosuns-briefing.helpers ;` to import the helpers, plus
   `[ crew-line ] map` and `"\n" join`.
5. `briefing` (main) — composes everything: greeting, roster of
   the input, closing. The payoff: the main file reads as a
   high-level description because the small pieces have names.
