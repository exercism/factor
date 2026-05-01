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

## 4. Halve until target

- `produce` is the right tool: it generates a sequence by
  repeatedly testing and stepping.
- The state running through `produce` is *both* the running
  value and the target. Put `target` on the bottom and the
  current value on top; the predicate compares them with
  `2dup <` (target less than running, i.e., still above
  target).
- Inside the quotation, divide the current value by 2 with
  `2 /i` and `dup` the result so it both updates the running
  state and is emitted as the new element.
- After `produce`, the leftover state (target plus final
  value) needs to be dropped — `2nip` peels off the bottom
  two values and leaves only the produced sequence.

[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
