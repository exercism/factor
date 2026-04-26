# Hints

## General

- `accessors` provides the auto-generated `slot>>` getters,
  `>>slot` setters, and `change-slot` updaters.
- Setters and `change-slot` *mutate* the tuple. `clone` it first if
  you want a non-destructive update.

## 1. Define the `player` tuple

- The slot syntax is `{ name initial: value }` inside `TUPLE: …  ;`.
- Slots without an `initial:` clause default to `f`.

## 2. Introduce the player

- `name>>` reads the `name` slot.
- `unless*` from [`kernel`][kernel] is the "default if `f`" idiom.

## 3. Revive a fallen player

- `health>>` reads the slot; `zero?` from [`math`][math] tests for
  zero.
- Build the new player with `clone` followed by `100 >>health`
  and `100 >>mana`.
- For the "still alive" case, return `f`.

## 4. Take damage

- `change-health` accepts a quotation `( old-health -- new-health )`.
- A fry quotation `'[ _ - 0 max ]` (with `max` from
  [`math.order`][math.order]) gives you "subtract the captured
  damage and clamp at zero".
- Remember to `clone` before mutating.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[math]: https://docs.factorcode.org/content/vocab-math.html
[math.order]: https://docs.factorcode.org/content/vocab-math.order.html
