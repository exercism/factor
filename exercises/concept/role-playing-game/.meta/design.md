# Design

## Goal

Introduce Factor's tuple class system: defining slots with defaults,
reading via getters, mutating via setters, and cloning for non-
destructive updates.

## Learning objectives

- Define a tuple with `TUPLE:` and `{ slot initial: default }`.
- Construct tuples with literals and `boa`.
- Read slots via auto-generated `slot>>` getters.
- Update slots with `>>slot` and `change-slot`, cloning first to
  avoid mutating shared state.
- Use `unless*` for the "default value" pattern.

## Out of scope

- Tuple inheritance and mixins.
- Generic words and methods (`GENERIC:`, `M:`) — those are for
  `factory-failsafe`.
- Slot type declarations.

## Concepts

- `tuples`: defining tuple classes, slot defaults, getters/setters,
  `change-slot`, `clone` for non-mutating updates.

## Prerequisites

- `conditionals` — taught in `cars-assemble`.
- `numbers` — taught in `currency-conversion`.
