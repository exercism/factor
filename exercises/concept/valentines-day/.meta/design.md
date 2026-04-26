# Design

## Goal

Cover Factor's `case` combinator and contrast it with `cond`. Use
`SYMBOLS:` to introduce a small set of self-evaluating tag values
and dispatch on them.

## Learning objectives

- Use `case` from `combinators` for equality-based dispatch.
- Use `cond` for predicate-based dispatch.
- Declare symbols with `SYMBOLS:` and dispatch on them.
- Recognise the difference in default-branch behaviour: matched
  clauses consume the value, the default branch leaves it on the
  stack.

## Out of scope

- Tagged unions / variant types via tuples and `GENERIC:`.
- Pattern matching libraries (`match`).

## Concepts

- `case`: equality-based multi-way dispatch with `case` and the
  default branch.

## Prerequisites

- `conditionals` — taught in `cars-assemble`.
- `sequences` — taught in `backyard-birdwatcher` (for `first2`).
