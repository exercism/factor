# Hints

## General

- `<disjoint-set>`, `add-atoms`, `equate`, and `representative` all
  live in [`disjoint-sets`][disjoint-sets].
- These words take the disjoint set as their *last* argument, and most
  of them consume it without returning it. `keep` runs a word and then
  leaves a copy of that last argument on the stack.

## 1. Open the club

- `<disjoint-set>` makes the empty structure; `add-atoms` registers a
  whole sequence at once.
- `add-atoms` consumes the disjoint set. Use `[ add-atoms ] keep` to
  add the poets and still return the club.

## 2. Record a collaboration

- `equate` merges the groups of two atoms: `poet1 poet2 club equate`.
- It returns nothing, so `[ equate ] keep` leaves the club on the
  stack to return.

## 3. Find a poet's circle

- `representative` already has the shape you need — a poet and a club
  in, the circle's representative out.

## 4. Share a circle?

- Two poets share a circle exactly when `representative` returns the
  same value for both.
- Look up each poet's representative in the club, then compare the two
  with `=`. `[ representative ] curry` builds a quotation that looks a
  poet up in this particular club, and `bi@` applies it to both poets.

[disjoint-sets]: https://docs.factorcode.org/content/vocab-disjoint-sets.html
