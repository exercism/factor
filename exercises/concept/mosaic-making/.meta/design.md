# Design

## Goal

Introduce the small toolkit of array constructors and inspection
words that sit between the basic `sequences` protocol and the
higher-order word family.

## Learning objectives

- Build short arrays from stack values with `1array`, `2array`,
  `3array`.
- Flatten an array-of-arrays with `concat`.
- Reverse a sequence with `reverse`.
- Look up an element's position with `index`, or test
  membership with `member?`.
- Note the differing argument order of `index` (seq, elt) and
  `member?` (elt, seq).

## Out of scope

- Higher-order operations (`map`, `filter`, `each`, `reduce`) —
  that's `boutique-bookkeeping`.
- Mutable vectors and `push`/`set-nth` — not yet covered.
- The variadic `narray`.

## Concepts

- `arrays`: building, joining, reversing, and looking up in
  fixed-length arrays.

## Prerequisites

- `sequences` — taught in `backyard-birdwatcher`. Needed for
  array literals (`{ … }`) and a working notion of "sequence".
