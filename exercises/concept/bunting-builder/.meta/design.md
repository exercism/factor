# Design

## Goal

Introduce the `<iota>` + `map` + `>string` idiom for building a
string whose characters depend on their position.

## Learning objectives

- `<iota>` produces a virtual sequence of integers `0..n-1`.
- `[a..b]`, `[a..b)`, etc. (from `math.ranges`) produce bounded
  integer ranges, optionally starting away from `0`.
- `map` applies a quotation to each element and collects the
  results.
- `>string` (from `strings`) converts a sequence of character
  codes into a string.
- `CHAR: a + i` turns a 0-based offset into a letter.
- `mod`, `even?`, and `abs` drive position-based predicates and
  transformations inside the quotation.

## Out of scope

- The full `sequences` protocol (`length`, `first`, `nth`,
  `head`, `tail`, …) — that's `backyard-birdwatcher`.
- Higher-order words beyond `map` (`filter`, `reduce`, …) —
  that's `boutique-bookkeeping`.

## Concepts

- `tabulation`: building a string from index-driven decisions.

## Prerequisites

- `quotations` — taught in `high-school-sweetheart`.
- `strings` — taught in `log-levels`.
- `conditionals` — taught in `cars-assemble`. Needed for `if`
  inside the quotation.
