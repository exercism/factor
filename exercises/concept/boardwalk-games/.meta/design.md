# Design

## Goal

Introduce the `random` vocabulary: drawing random values, shuffling and
sampling sequences, and making randomness reproducible with a seeded
generator.

## Learning objectives

- Use `random` on an integer (`[0, n)`) and on a sequence (a random
  element).
- Shuffle a sequence with `randomize`.
- Draw distinct elements with `sample`.
- Install a seeded generator with `<mersenne-twister>` and `with-random`
  to make outcomes reproducible.
- Recognise that a word wrapping `with-random` must be `inline` for the
  quotation to return a value.

## Out of scope

- The random-generator protocol (`random-32*`, `random-bytes*`) and
  writing custom generators.
- `random-bits`, `random-unit(s)`, `uniform-random`, `normal-random`,
  and other distribution words.
- `system-random-generator` / `secure-random-generator` and the
  cryptographic generators.

## Concepts

- `randomness`: the `random` vocabulary — `random`, `randomize`,
  `sample`, and reproducible randomness via `with-random` plus
  `<mersenne-twister>`.

## Prerequisites

- `numbers` — taught in `currency-conversion` (range arithmetic in
  `roll-die`).
- `sequences` — taught in `backyard-birdwatcher` (`random` on a
  sequence, `randomize`, `sample`).
- `quotations` — taught in `high-school-sweetheart` (the quotation
  argument to `play-seeded`).
- `combinators` — taught in `joiners-journey` (`dip` in `play-seeded`).
