# Design

## Goal

Introduce the higher-order sequence words — those that take a
quotation — by working with a small inventory of `{ name price }`
items.

## Learning objectives

- Pass quotations to `filter`, `reject`, `count`, `map`, and `map-sum`.
- Sort with `sort-by` from `sorting`.
- Pick extreme elements with `infimum-by` and `supremum-by` from
  `math.statistics`.

## Out of scope

- Mutating sorts (`sort!`).
- `fold` / `reduce` and explicit accumulator patterns.
- Tuples, hashtables — items are kept as plain 2-arrays.

## Concepts

- `higher-order-sequences`: passing a quotation as the second
  argument to drive sorting, filtering, counting, and reduction.

## Prerequisites

- `sequences` — taught in `backyard-birdwatcher`.
- `quotations` — introduced in `high-school-sweetheart`.
