# Hints

## 1. `assign-bibs`

- Use `map-index`. The quotation has `index` on top of the
  stack, with `name` below it. To produce a `{ position name }`
  pair you'll want them in the opposite order before calling
  `2array`.

## 2. `lane-labels`

- Use `map-index`.
- `sprintf` reads its arguments bottom-up: the leftmost `%`
  placeholder takes the bottom-most arg, the rightmost takes
  the top.
- For `"Lane %d: %s"`, you want `index` (a number) to feed
  `%d` and `name` (a string) to feed `%s`. Reorder the stack
  inside the quotation accordingly.

## 3. `tag-runners`

- The `tag` argument needs to be available to every per-element
  call. `curry` (or `fry`) bakes it in.
- Inside the quotation, you'll have three values to feed
  `sprintf`: the tag, the index, and the name. `spin` reverses
  the top three of the stack, which is the move you'll want.

## 4. `record-finishes`

- The ledger needs to be available to every per-element call.
  `fry` (`'[ … _ … ]`) is the natural way: the `_` becomes the
  ledger.
- Build the per-finisher string with `sprintf`, then `push` it
  onto the ledger.
- `each-index` returns nothing; the mutation *is* the result.

## 5. `hoofbeats`

- `times` is `inline`, so its quotation can have a non-`( -- )`
  effect. Use a quotation of effect `( str -- str )` to thread
  a running string across iterations.
- Start with the empty string `""` on the stack.
