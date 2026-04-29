# Design

## Goal

Introduce the four core "view a sequence as pieces" words —
`group`, `clump`, `split-when`, `monotonic-split` — and the
mental model that distinguishes them (size vs single-element
break vs adjacent-pair test).

## Learning objectives

- Use `group` for fixed-size disjoint chunks.
- Use `clump` for fixed-size sliding windows.
- Use `split-when` for predicate-driven breaks on single
  elements.
- Use `monotonic-split` for predicate-driven runs on adjacent
  pairs.

## Out of scope

- The slice-returning variants (`group-slice`,
  `monotonic-split-slice`).
- `<groups>`/`<clumps>` (the virtual constructors).
- Multi-character separators (those are `split` / `split-subseq`
  territory, taught earlier in `log-levels`).

## Concepts

- `windows`: viewing a sequence as a sequence of pieces.

## Prerequisites

- `higher-order-sequences` — taught in `boutique-bookkeeping`.
  Needed for `with` (used to bake `junctions` into the
  per-element predicate in task 3) and for the general
  quotation idiom.
