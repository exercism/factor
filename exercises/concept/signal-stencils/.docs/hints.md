# Hints

## General

- `MACRO:` is in [`macros`][macros]. Most building blocks live
  in `kernel`, `sequences`, and `combinators`.
- A macro body must leave one quotation on the compile-time
  stack. If your body produces an array, convert it with
  `>quotation`.

## 1. Twice over

- Build `[ A A ]` from `[ A ]` with `dup append`.

## 2. N repetitions

- `<repetition>` from `sequences` builds a virtual sequence of
  N copies of an element. Its stack effect is `( length elt -- )`,
  so swap the inputs before calling it. `concat` flattens; `>quotation`
  converts the resulting array back into a quotation:
  `swap <repetition> concat >quotation`.

## 3. Compose many

- `concat` already does the work; just convert with `>quotation`.

## 4. Unrolled iteration

- For each element of `seq`, build a quotation `[ elt original-quot ]`
  by currying `elt` into `original-quot`. Then `concat` the
  per-element quotations and convert.
- The dense Factor expression: `[ curry ] curry map concat >quotation`.
  The outer `curry` bakes `original-quot` into the inner
  `[ curry ]` body, so what `map` actually applies to each
  element is a quotation that curries the element into the
  original quot.

[macros]: https://docs.factorcode.org/content/vocab-macros.html
