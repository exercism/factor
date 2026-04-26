# Design

## Goal

Show how Factor builds closures: `curry` for a single capture,
`compose` for joining quotations, and fry `'[ … _ … ]` for
capturing several values.

## Learning objectives

- Use `curry` to bake a value into a quotation.
- Use `compose` to glue two quotations into one.
- Use fry `'[ … _ … ]` (in `fry`) to capture multiple values.
- Invoke a stored quotation with `call( … -- … )`.

## Out of scope

- Lexically scoped locals (`::`, `[let | ]`) — those are for
  `lasagna-luminary`.
- Memoization (`MEMO:`) — kept out so the focus stays on closure
  construction.

## Concepts

- `curry-compose-fry`: building closures from values, joining
  quotations, and capturing multiple values with fry.

## Prerequisites

- `quotations` — introduced in `high-school-sweetheart`.
- `sequences` — taught in `backyard-birdwatcher`.
