# Design

## Goal

Introduce `reduce` as Factor's general fold and the cumulative
family (`cum-sum`, `cum-product`, `cum-min`, `cum-max`) for
running summaries.

## Learning objectives

- `reduce` consumes a sequence and a seed, threading an
  accumulator through a `( prev elt -- next )` quotation.
- A non-zero seed plus a per-step combiner (e.g. `0 max`) lets
  `reduce` express folds that `sum` or `product` cannot.
- `cum-sum` returns the running totals of a sequence.
- `cum-min` and `cum-max` return the running watermarks.
- Cumulative reductions can be chained — the output of one fed
  into another — to express running summaries of running
  quantities.

## Out of scope

- `produce` (unfold) — the inverse pairing with `reduce`.
- `cum-sum0` and other less common cumulative variants.

## Concepts

- `reductions`: folding a sequence into a single value, or into
  a sequence of running values.

## Prerequisites

- `higher-order-sequences` — taught in `boutique-bookkeeping`.
  Needed for the quotation-driven feel of `reduce`.
