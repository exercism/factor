# Design

## Goal

Introduce quotations and the everyday combinators (`call`, `compose`, `bi@`) by stitching together small string-processing words into a single composite word.

## Learning objectives

- Read and write quotation literals (`[ ... ]`).
- Run a quotation with `call`.
- Combine two quotations with `compose`.
- Apply one quotation to two inputs with `bi@`.
- Reuse previously-defined words in new word bodies — the everyday Factor form of "function composition".

## Out of scope

- The full combinator zoo (`tri`, `cleave`, `dip`, `keep`, …).
- Inferring quotation stack effects.
- Higher-order combinators that take quotation arrays.

## Concepts

- `quotations`: anonymous deferred code, plus the small handful of words that operate on them.

## Prerequisites

- `stack-effect` — taught in `lasagna`.

The exercise also leans on a few string words (`replace`, `[ blank? ] trim`, `1string`, `>upper`, `append`, `glue`, `surround`). These are introduced inline in the exercise's introduction — a dedicated `strings` concept exercise would naturally come first, but the words used here are simple enough to teach in passing.
