# Design

## Goal

Cover Factor's error model end-to-end: signalling with `throw`,
handling with `recover`, and defining error classes with `ERROR:`.

## Learning objectives

- Use `throw` (from `kernel`) to raise an error.
- Use `recover` (from `continuations`) for try/recover handling.
- Define error classes with `ERROR:` and use the auto-generated
  constructor / predicate.

## Out of scope

- Restartable conditions and the `restarts` machinery.
- `cleanup` for finally-style blocks.
- Generic words and methods.

## Concepts

- `errors`: `throw`, `recover`, `ERROR:` and the tuple-typed error
  classes it produces.

## Prerequisites

- `tuples` — taught in `role-playing-game`.
- `conditionals` — taught in `cars-assemble`.
