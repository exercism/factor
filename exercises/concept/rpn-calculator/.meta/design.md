# Design

## Goal

Treat quotations as first-class values: build a tiny RPN evaluator
where each operation is a quotation operating on a value-stack
represented as an array.

## Learning objectives

- Use `call( stack-effect )` to invoke a quotation whose effect is
  not statically inferable.
- Hold quotations in sequences and apply them with `each`.
- Slice with `head*` and `last2` to write stack-consuming ops.

## Out of scope

- `curry`, `compose`, fry — those are for `coordinate-choreography`.
- Error handling — for `factory-failsafe`.

## Concepts

- `quotations-call`: quotations as values, `call`, declared call
  effects, sequences of quotations.

## Prerequisites

- `sequences` — taught in `backyard-birdwatcher`.
- `quotations` — introduced in `high-school-sweetheart`.
