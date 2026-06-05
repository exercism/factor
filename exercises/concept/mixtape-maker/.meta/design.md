# Design

## Goal

Introduce the [`math.combinatorics`][math.combinatorics] vocabulary —
counting and listing combinations and permutations — by choosing and
ordering the songs on a mixtape.

## Learning objectives

- Use `nCk` to count the k-combinations of n items ("n choose k").
- Use `nPk` to count the k-permutations of n items.
- Use `all-combinations` to produce every k-element subset of a sequence.
- Use `each-combination` to stream the k-combinations of a sequence.
- Use `all-permutations` to produce every ordering of a sequence.
- Use `each-permutation` to stream the orderings of a sequence.
- Combine `all-combinations` with `filter` to keep only the selections
  that meet a condition.

## Out of scope

- Computing counts by hand with factorials.
- The lazy view words `<combinations>` and `<permutations>`.
- Powersets and `all-subsets`.

## Concepts

- `combinatorics`: the `math.combinatorics` words `nCk`, `nPk`,
  `all-combinations`, `each-combination`, `all-permutations`, and
  `each-permutation`.

## Prerequisites

- `higher-order-sequences` — the student uses `filter` in the final task.
- `reductions` — the final task sums each combination.
- `locals` — the final task is written with a `::` definition.

[math.combinatorics]: https://docs.factorcode.org/content/vocab-math.combinatorics.html
