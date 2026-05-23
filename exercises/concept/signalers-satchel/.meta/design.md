# Design

## Goal

Teach three idioms a student needs before reaching the
streams/destructors area of the tree but that fall through the
cracks of the basic `combinators` and `sequences` exercises:

- `unparse` as the universal value-to-source serializer.
- The slice variants (`head-slice`, `tail-slice`,
  `head-slice*`, `tail-slice*`) — non-copying views that
  contrast with the copying `head`/`tail` family.
- The multi-input cleave family (`2bi`, `3bi`, `2tri`, `3tri`)
  — when more than one projection depends on the same pair or
  triple of stack values.

## Learning objectives

- Reach for `unparse` (not `>string` or `number>string`) when
  the receiver will parse the text back.
- Distinguish `head`/`tail` (copying) from `head-slice`/`tail-slice`
  (viewing), and the `*` variants that operate from the other end.
- Recognise the shape that justifies `2bi`/`2tri`/`3bi`/`3tri`:
  several distinct projections of the *same* multi-value input.

## Out of scope

- Implementing custom prettyprint methods (`M: foo pprint*`).
- The inverse of `unparse` — `parse`/`eval` deserve their own
  treatment.
- `cleave*`/`bi*`/`tri*` and their multi-input variants
  (covered briefly in the introduction in `joiners-journey`
  only).
- The `slices` vocab's lower-level constructors (`<slice>` etc.).

## Concepts

- `wire-format`: serialising with `unparse`, viewing with the
  slice family, projecting with the multi-input cleave family.

## Prerequisites

- `combinators` — taught in `joiners-journey`. Students must
  already be fluent with `bi`/`tri`/`cleave` to extend to the
  multi-input variants.
- `sequences` — taught in `backyard-birdwatcher`. Students must
  already know `head`/`tail`/`head*`/`tail*` to extend to the
  slice variants.
- `tuples` — taught in `role-playing-game`. A `slice` is a
  tuple; understanding tuple structure helps demystify why a
  slice can substitute for a string.
- `strings` — taught in `log-levels`. `unparse` produces strings;
  tests compare against literal strings.

## Tasks ramp

1. `quote-value` — `unparse` on its own.
2. `flag-body` — two slice calls chained (`tail-slice` then
   `head-slice*`).
3. `split-flag` — `2bi` falls out naturally when both
   `head-slice` and `tail-slice` need the same two inputs.
4. `triangulate` — `2tri` for three projections of the same
   pair.
5. `triangle-stats` — `3tri` for three projections of the same
   triple.
