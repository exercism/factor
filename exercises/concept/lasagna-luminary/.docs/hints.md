# Hints

## General

- The `locals` vocabulary provides `::` and `[| | ]`.
- Locals don't replace stack code — use them where they add
  clarity.

## 1. Determine the cooking status

- `cond` from [`combinators`][combinators] is the right shape: one
  branch checks `dup not` (timer is `f`), another checks
  `dup zero?`, and a default handles the rest. Each branch should
  `drop` the timer before pushing the string.

## 2. Estimate the preparation time

- `:: preparation-time ( layers minutes-per-layer -- total )`
  with `layers length minutes-per-layer *`.

## 3. Compute the noodles and sauce needed

- Locals let you refer to `layers` twice without `dup`. `count`
  with the predicate `[ "noodles" = ]` (or `"sauce" =`) gives you
  each layer count.
- `1/5` is a Factor rational literal.

## 4. Add the secret ingredient

- `last` (in [`sequences`][sequences]) reads the final element;
  `suffix` appends one to the end.

## 5. Scale the recipe

- The scale factor is `portions / 2`. Locals let you reference
  `portions` inside the lambda.
- `assoc-map` from [`assocs`][assocs] takes a `( key value -- newkey newvalue )`
  quotation. Inside `[| key value | … ]`, return both values to keep
  the same key and produce a new value.

[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[assocs]: https://docs.factorcode.org/content/vocab-assocs.html
