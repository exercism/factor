# Design

## Goal

Introduce dynamic variables (`SYMBOL:`) and the global accessor words
for storing module-level state.

## Learning objectives

- Declare dynamic variables with `SYMBOL:` / `SYMBOLS:`.
- Read with `get-global`, write with `set-global`, mutate with
  `change-global`.
- Use a mutable `V{ }` (always `clone`d) as the value held by a
  dynamic variable.
- Search a sequence with `find` and recover from "no match" with
  `unless*`.

## Out of scope

- `with-variable` and dynamic scoping for nested binding (the
  exercise uses module-level state, the `-global` flavour).
- Concurrency primitives — the elixir version uses Agents; here the
  state is just a global.

## Concepts

- `dynamic-variables`: `SYMBOL:` declarations and the global
  accessor protocol for module-wide state.

## Prerequisites

- `tuples` — taught in `role-playing-game`.
- `sequences` — taught in `backyard-birdwatcher`.
- `locals` — taught in `lasagna-luminary` (used in `release`,
  `get-registration`).
