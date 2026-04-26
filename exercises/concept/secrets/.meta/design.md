# Design

## Goal

Introduce Factor's integer bit-shifts and bitwise logic, plus the
`bits` mask from `math.bitwise` for working with fixed-width
twos-complement values.

## Learning objectives

- Use `shift` for left and right shifts (positive amount = left,
  negative = right).
- Use `bitor`, `bitand`, `bitxor`, `bitnot` for bit-level logic.
- Use `bits` from `math.bitwise` to clip to a fixed bit-width — the
  Factor idiom for "treat this as an N-bit unsigned integer".

## Out of scope

- Bitfields, byte arrays, packing/unpacking.
- The wider `math.bitwise` API (`set-bit`, `clear-bit`, `mask?`,
  `shift-mod`, `bitroll`, …).
- Floating-point bit representations.

## Concepts

- `bitwise-operations`.

## Prerequisites

- `stack-effect` — taught in `lasagna`.
