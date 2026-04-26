# Hints

## General

- `case` (in [`combinators`][combinators]) is the right tool for
  matching on equal values; `cond` is the right tool for
  guarded predicates.
- The symbols (`yes`, `no`, `maybe`, `korean`, …) are already
  declared via `SYMBOLS:` in the exercise file.

## 1. Rate the cuisine

- A two-clause `case` mapping `korean` and `turkish` to their
  approval values.

## 2. Rate the movie genre

- Match `romance` and put a `[ drop no ]` default for the rest.
  Remember the default branch sees the original value on top — drop
  it before pushing the result.

## 3. Rate the walk

- Use `cond` (also in `combinators`) — each guard is `[ dup N > ]`.
  The body needs to `drop` the kilometres before pushing the
  approval.

## 4. Rate the activity

- The activity is `{ tag value }`. Use `first2` to push both onto
  the stack, then `swap` so the tag is on top — that's what `case`
  matches against.
- Branches for `board-game` and `chill` see the (`f`) value still on
  the stack; `drop` it before pushing the approval.
- Branches for `movie`, `restaurant`, and `walk` see the relevant
  value still on the stack — so you can call your task-2/1/3 word
  directly.

[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
