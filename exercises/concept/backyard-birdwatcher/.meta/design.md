# Design

## Goal

Introduce the `sequences` vocabulary by working with arrays of bird
counts.

## Learning objectives

- Index into a sequence with `first`, `last`, and `nth`.
- Slice with `head` and `tail`.
- Pad to a target length with `pad-tail` (and `pad-head`).
- Aggregate with `sum` (from `math.statistics`).
- Filter-count with `count` and test with `any?`.
- Build a new sequence with `unclip-last` and `suffix`.

## Out of scope

- Mapping and filtering returning new sequences (`map`, `filter`).
- Mutable vectors (`V{ }`).
- The full sequence protocol and writing custom sequences.

## Concepts

- `sequences`: array literals, indexing, slicing, aggregating,
  predicates, and constructing new sequences without mutation.

## Prerequisites

- `stack-effect` — taught in `lasagna`.
- `conditionals` — taught in `cars-assemble`. Needed for the `>=`
  predicate inside `count`.
