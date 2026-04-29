# Hints

## General

- `set-nth ( elt n seq -- )`, `change-nth ( i seq quot -- )`,
  `push ( elt seq -- )`, and `pop ( seq -- elt )` all *mutate*
  their sequence argument and return nothing about it on the
  stack — the change is the effect.

## 1. Fresh mosaic

- `<array>` (in [`arrays`][arrays]) takes a length and a fill
  value and returns a new array.

## 2. Place a tile

- `set-nth` does the assignment.

## 3. Chip a tile out

- "Set this position to `f`" — same shape as task 2.

## 4. Re-colour a tile

- `change-nth` runs a quotation on the element at the given
  position and stores the result back.

## 5. Snapshot

- `clone` (in [`kernel`][kernel]) returns an independent copy.

## 6. Stash

- `push` appends an element to a vector in place.

## 7. Return

- `pop` removes and returns the last element of a vector.

[arrays]: https://docs.factorcode.org/content/vocab-arrays.html
[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
