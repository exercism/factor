# Design

## Goal

Show explicit recursion in Factor — `:` definitions that call
themselves with `unclip` to peel off one element at a time.

## Learning objectives

- Write a recursive `:` definition with a base case and a
  recursive step.
- Use `if-empty` for the empty / non-empty split.
- Use `cond` for multi-way branching inside a recursion.
- Use `unclip` and `rest` to advance to the next sub-problem.
- Build sequences with `prefix`.

## Out of scope

- The `recursive` modifier on inline words (these `:` definitions
  don't need it).
- Mutual recursion.
- Tail-call optimisation specifics.

## Concepts

- `recursion`: writing words that call themselves, with a base case
  and a recursive step.

## Prerequisites

- `sequences` — taught in `backyard-birdwatcher`.
- `conditionals` — taught in `cars-assemble`.
