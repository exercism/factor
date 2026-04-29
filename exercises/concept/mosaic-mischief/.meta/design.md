# Design

## Goal

Introduce in-place mutation of sequences — both fixed-length
arrays and growable vectors — and the `clone` word for taking a
defensive snapshot before mutating.

## Learning objectives

- Build a fresh mutable array with `<array>`.
- Mutate an array slot with `set-nth`, and apply a quotation in
  place with `change-nth`.
- Use the `V{ … }` literal and `<vector>` for variable-length
  sequences.
- Append to and pop from a vector with `push` and `pop`.
- Snapshot a sequence with `clone` before mutating it.

## Out of scope

- The full `vectors` API (`pop*`, `<vector>` capacity tuning,
  `delete-nth`, `remove-nth`, `insert-nth`, `clear`).
- Hashtables and other mutable containers.
- Concurrent mutation / atomic updates.

## Concepts

- `mutation`: in-place updates to arrays and vectors.

## Prerequisites

- `arrays` — taught in `mosaic-making`. Needed for the
  immutable-array baseline this exercise contrasts with.
- `sequences` — taught in `backyard-birdwatcher`. Needed for the
  generic sequence protocol that `set-nth`/`push`/`pop` build
  on.
