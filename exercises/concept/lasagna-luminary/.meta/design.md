# Design

## Goal

Introduce Factor's named bindings: `::` for word definitions and
`[| | ]` for inline lambdas.

## Learning objectives

- Replace `:` with `::` to give inputs names inside the body.
- Use `[| inputs | body ]` lambdas with higher-order words like
  `assoc-map`.
- Recognise when locals improve clarity (multiple references, awkward
  stack order, multi-value lambdas) and when plain stack code is
  fine.

## Out of scope

- `[let | … |]` blocks for binding intermediate values.
- Mutable locals (`!` suffix) and reference cells.

## Concepts

- `locals`: `::` definitions and `[| | ]` lambdas, when each is
  appropriate.

## Prerequisites

- `sequences` — taught in `backyard-birdwatcher`.
- `assocs` — taught in `storeroom-stocktake`.
- `conditionals` — taught in `cars-assemble`.
