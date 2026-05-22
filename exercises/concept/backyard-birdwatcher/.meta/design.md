# Design

## Goal

Introduce the `sequences` vocabulary by working with arrays of bird
counts.

## Learning objectives

- Index into a sequence with `first`, `last`, and `nth`.
- Slice with `head` and `tail`, clamping with `index-or-length`
  when the count may exceed the sequence.
- Pad to a target length with `pad-tail` (and `pad-head`).
- Aggregate with `sum` (from `sequences`).
- Filter-count with `count` and test with `any?`.
- Build a new sequence with `prefix`/`suffix` and
  `unclip`/`unclip-last`.

## Out of scope

- Mapping and filtering returning new sequences (`map`, `filter`).
- Mutable vectors (`V{ }`).
- The full sequence protocol and writing custom sequences.

## Concepts

- `sequences`: array literals, indexing, slicing, aggregating,
  predicates, and constructing new sequences without mutation.

## Prerequisites

- `basics` — taught in `lasagna`.
- `conditionals` — taught in `cars-assemble`. Needed for the `>=`
  predicate inside `count`.
