# Hints

## General

- The `plot` tuple, the `registrations` and `next-id` symbols, and
  the `not-found` symbol are already declared in the exercise file.
- For module-level state, use `set-global`, `get-global`, and
  `change-global`.

## 1. Open the garden

- `V{ } clone` is the right starting value for `registrations`
  (always `clone` so the literal isn't shared between calls).
- `1 next-id set-global` sets the counter.

## 2. List the registrations

- A single `registrations get-global` is enough.

## 3. Register a plot

- Read `next-id` first, then `plot boa` to build the plot from
  `id` and `name`.
- Bump the counter with `next-id [ 1 + ] change-global`.
- `push` (in [`sequences`][sequences]) appends to a vector in place
  — perfect for `registrations get-global`.

## 4. Release a plot

- A `:: release ( id -- )` makes `id` available inside the filter
  predicate.
- `[ id>> id = ] reject` keeps every plot whose `id` slot does *not*
  match the local `id`. Use it as the body of a `change-global`.

## 5. Get a registered plot

- `find` returns `( index elt/f )`. `nip` drops the index.
- `[ not-found ] unless*` substitutes the symbol when nothing was
  found.

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
