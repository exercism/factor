# Hints

## General

- All five combinators live in [`kernel`][kernel] except `cleave`,
  which is in [`combinators`][combinators]. Either of `tri` or
  `cleave` is fine for task 3.
- `1/50` and `1/20` are Factor rational literals — exact, and
  cleaner than `0.02` and `0.05` in the test output.

## 1. Add the kerf allowance

- `[ 1/50 * ] keep` leaves both the kerf and the original length on
  the stack. A trailing `+` sums them.

## 2. Compute kerf and finish allowances

- Two quotations of one value is exactly what `bi` is for:
  `[ 1/50 * ] [ 1/20 * ] bi`.

## 3. Build the cut card

- Three quotations of one value: `tri` (or `cleave`).
- The first quotation should leave the input untouched. `[ ]` —
  the empty quotation — is the identity.

## 4. Per-piece length

- `pieces` is on top, but the value you actually want to transform
  is `bolt-length` underneath. `[ with-kerf ] dip` applies
  `with-kerf` to `bolt-length` while leaving `pieces` on top, so a
  trailing `/` divides by `pieces`.

## 5. Compare two bolts

- The same kerf calculation applied to two values: `bi@`.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
