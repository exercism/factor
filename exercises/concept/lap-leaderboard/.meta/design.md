# Design

## Goal

Introduce the four "walk a sequence with the index" / "counted
loop" words and show how `times`, `each-index`, and `map-index`
can thread an accumulator through their quotations.

## Learning objectives

- Use `map-index` and `each-index` with the index on top of the
  stack inside the quotation.
- Use `times` for counted iteration, including the
  effect-balanced form that threads stack across iterations.
- Combine the indexed words with `curry`, `fry`, and vector
  mutation to do non-trivial work per element.

## Out of scope

- `each-index-from`, `map-index-from` (offset variants).
- `reduce-index`, `2each`, `2map` (other indexed/multi-seq
  helpers).
- `iota` for index-only iteration.

## Concepts

- `indexed-iteration`: walking a sequence with the index in
  scope, plus counted iteration with `times`.

## Prerequisites

- `higher-order-sequences` — taught in `boutique-bookkeeping`.
  Needed for `map`, `each`, and the `inline`/quotation idiom.
- `mutation` — taught in `mosaic-mischief`. Needed for the
  `each-index` + `push` task.
- `curry-compose-fry` — taught in `coordinate-choreography`.
  Needed for baking `tag` and `ledger` into per-element
  quotations.

## Theme

A vehicle-neutral race story: the icon is a four-wheeled racer
on a dirt course but the prose talks about "racers" and
"finishers" so the framing applies to RC cars, motorcycles,
yachts, runners, or anything else.
