# Hints

## General

- The [`sequences`][sequences] vocabulary covers nearly everything.
- `sum` lives in [`math.statistics`][math.statistics].

## 1. Today's count

- `last` returns the final element of a sequence.

## 2. Increment today's count

- `unclip-last` peels off the last element so you can transform it,
  and `suffix` appends an element to a sequence — together they give
  you a non-destructive "modify the last element" pattern.

## 3. Was there a day with no birds?

- `any?` takes a sequence and a predicate quotation and returns `t`
  if the predicate held for at least one element.
- The predicate quotation for "is this number zero?" is `[ zero? ]`.

## 4. Sum the first few days

- `head` takes a sequence and a count `n` and returns the first `n`
  elements.
- Then sum the result.

## 5. Count the busy days

- `count` takes a sequence and a predicate, like `any?` does, but
  returns *how many* elements matched.

## 6. Pad missing days

- `pad-tail` takes a sequence, a target length, and a fill element,
  and extends the sequence to that length by appending copies of
  the element. If the sequence is already long enough, it is
  returned unchanged.

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
