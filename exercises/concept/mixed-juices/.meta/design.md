# Design

## Goal

Introduce `while` (and the symmetric `until`) as Factor's
predicate-driven loop combinator. Show how loop state lives on
the stack for single-value loops and in named locals for
multi-value loops.

## Learning objectives

- `while ( pred body -- )` repeats `body` as long as `pred`
  leaves a truthy value on top.
- `until` is the symmetric form (loop while `pred` returns `f`).
- Single-value loops thread state through the stack; multi-value
  loops use `::` parameters and `:> name!` mutable locals.
- `unclip ( seq -- rest first )` is the typical way to consume a
  list one element per iteration inside a loop body.

## Out of scope

- `loop` (the unconditional loop combinator).
- Recursion as an alternative — that's `backyard-birdcount`.

## Concepts

- `while`: predicate-driven iteration with quotation bodies.

## Prerequisites

- `combinators` — taught in `joiners-journey`. Needed for the
  general feel of quotation-driven control flow.
- `higher-order-sequences` — taught in `boutique-bookkeeping`.
  Task 3 uses `map`.
- `conditionals` — taught in `cars-assemble`. Tasks 1 and 2 use
  `cond`.
