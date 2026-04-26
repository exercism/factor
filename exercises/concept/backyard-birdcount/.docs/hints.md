# Hints

## General

- `if-empty` from [`sequences`][sequences] is the right base case
  for recursion: empty sequence one branch, non-empty the other.
- `unclip` returns `( seq -- rest first )` — exactly what a
  recursive helper needs to consume one element and recurse on the
  rest.

## 1. Today's count

- Today's count is the first element. `if-empty` gives you the
  empty case for free.

## 2. Increment today's count

- `unclip 1 + prefix` peels the first element, increments it, and
  glues it back on. `prefix` lives in [`sequences`][sequences].

## 3. Was there a day with no birds?

- Two halting conditions plus a recursive step: `cond` with
  `dup empty?` and `dup first zero?` predicates, then a default
  branch that `rest`s the sequence and recurses.

## 4. Total birds since you started

- Base case: empty sequence sums to `0`.
- Recursive case: `unclip swap total +` — peel the first, recurse
  on the rest, add.

## 5. Busy days

- Base case: empty sequence has `0` busy days.
- Recursive case: peel the first count off with `unclip`, compare
  to `5`, recurse on the rest, then add `1` if today was busy.

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
