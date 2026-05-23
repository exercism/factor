# Hints

## General

- All the cleanup words live in [`destructors`][destructors].
- `:>` and `::` (locals) keep the multi-pump bodies readable —
  add `locals` to `USING:` if you reach for them.

## 1. Drain the bilge

- One word: `dispose`.

## 2. Pump-out routine

- One word: `with-disposal`. Add `inline` after the closing `;`
  so the compiler can see through the quotation argument:
  `: pump-out ( pump quot -- ) with-disposal ; inline`.

## 3. Whole-shift routine

- Open the scope with `with-destructors`. Inside, register each
  pump with `&dispose`, then `call` the quotation. With locals:
  `[ pump-a &dispose pump-b &dispose quot call ] with-destructors`.

## 4. Risky pump-out

- Same shape as task 3 but with `|dispose` (failure-only) on a
  single pump.

## 5. A custom disposable: the valve

- `TUPLE: valve < disposable is-open ;` — `<` extends `disposable`
  so the framework's machinery is inherited.
- `<valve>` uses `new-disposable` (not plain `new`) so the new
  valve is registered with the framework.
- `M: valve dispose*` is your cleanup hook. Returning nothing on
  the stack matters — `>>is-open` leaves the tuple on top, so
  end with `drop`.

[destructors]: https://docs.factorcode.org/content/vocab-destructors.html
