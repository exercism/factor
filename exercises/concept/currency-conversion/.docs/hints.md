# Hints

## General

- All the words you need live in the [`math`][math] and
  [`math.functions`][math.functions] vocabularies. Add them to your
  `USING:` line.

## 1. Estimate value after exchange

- Use `/` (stack effect `( x y -- x/y )`) to divide budget by rate.

## 2. Calculate currency left after an exchange

- Use `-` to subtract.

## 3. Calculate value of bills

- Use `*` to multiply.

## 4. Calculate number of bills

- The `amount` may be a float; you need an integer result.
- One approach: convert the amount to an integer first with
  `floor >integer`, then divide with `/i`.
- An alternative: use `/i` directly — for an integer denominator it
  also truncates the float — and then convert with `>integer`.

## 5. Calculate leftover after exchanging into bills

- Use `mod` for the remainder.

## 6. Calculate value after exchange

- Compute the *total* exchange rate: take `spread` percent of
  `exchange-rate` and add it to `exchange-rate`.
- Then call `exchange-money` with the budget and total rate.
- Then call `number-of-bills` to round down to a whole number of
  bills of the given denomination.
- Then call `value-of-bills` to get the final value.
- The four sub-calculations chain naturally; if your stack juggling
  starts to feel awkward, the locals form (`::` with named parameters)
  is fine here.

[math]: https://docs.factorcode.org/content/vocab-math.html
[math.functions]: https://docs.factorcode.org/content/vocab-math.functions.html
