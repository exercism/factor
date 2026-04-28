# Hints

## General

- `reduce` takes the sequence first, then the seed, then the
  quotation. The quotation receives `( prev elt -- next )` — the
  running accumulator first, then the next element.
- The cumulative family (`cum-sum`, `cum-product`, `cum-min`,
  `cum-max`) lives in [`math.statistics`][math.statistics] and
  returns a sequence the same length as its input.

## 1. Honour the request queue

- The seed for `reduce` is the opening balance.
- The combiner adds the request to the running balance and then
  floors at zero with `0 max` so the balance never goes negative.
- The arguments arrive on the stack as `( opening requests )`
  but `reduce` wants `( seq init quot )` — a `swap` away.

## 2. Running balance

- One word — `cum-sum`.

## 3. Least balance so far

- First compute the running balance, then run the running
  minimum over that result. Two words, chained.

[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
