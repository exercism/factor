# Hints

## General

- Every task is a thin wrapper over a word from the
  [`math.combinatorics`][math.combinatorics] vocabulary.
- The counting words take two integers; the listing words take a
  sequence.

## 1. Count combinations

- `nCk ( n k -- m )` returns the number of ways to choose `k` items
  from `n`. The stack is already in the right order — just call it.

## 2. Count permutations

- `nPk ( n k -- m )` returns the number of ordered ways to choose `k`
  items from `n`.

## 3. List combinations

- `all-combinations ( seq k -- combinations )` returns every
  `k`-element subset of `seq`, in lexicographic order.

## 4. List permutations

- `all-permutations ( seq -- permutations )` returns every ordering of
  `seq`.

## 5. Combinations summing to a target

- Start with every `k`-combination from `all-combinations`.
- Keep only the ones whose elements add up to `target`. `filter` from
  [`sequences`][sequences] takes a quotation that returns a boolean;
  inside it, `sum` (from [`math`][math]) totals one combination, and
  `=` compares it with the target.
- Because the task needs `target` inside the quotation, defining the
  word with `::` (from [`locals`][locals]) lets you refer to `seq`,
  `k`, and `target` by name.

[math.combinatorics]: https://docs.factorcode.org/content/vocab-math.combinatorics.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[math]: https://docs.factorcode.org/content/vocab-math.html
[locals]: https://docs.factorcode.org/content/vocab-locals.html
