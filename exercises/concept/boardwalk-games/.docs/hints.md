# Hints

## General

- Everything you need is in the [`random`][random] vocabulary, except
  `<mersenne-twister>`, which lives in
  [`random.mersenne-twister`][mt].

## 1. Roll a die

- `random` of an integer `n` gives `0..n-1`. Add `1` to shift the range
  to `1..n`.

## 2. Grab a prize

- `random` applied to a sequence already returns a random element — no
  extra work needed.

## 3. Shuffle the deck

- `randomize` shuffles a sequence and returns it.

## 4. Deal a hand

- `sample` takes the sequence and the count and returns that many
  distinct elements.

## 5. Replay from a seed

- Turn the seed into a generator with `<mersenne-twister>`, then run the
  quotation under `with-random`.
- `[ <mersenne-twister> ] dip` converts the seed while leaving the
  quotation on top of the stack for `with-random`.
- Mark the word `inline` so the quotation can return its result to the
  caller.

[random]: https://docs.factorcode.org/content/vocab-random.html
[mt]: https://docs.factorcode.org/content/vocab-random.mersenne-twister.html
