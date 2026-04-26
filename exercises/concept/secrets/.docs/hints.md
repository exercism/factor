# Hints

## General

- `bitor`, `bitand`, `bitxor`, `bitnot`, and `shift` all live in
  [`math`][math].
- `bits` is in [`math.bitwise`][bitwise].
- One of the test inputs is a negative `Int32` value, so make sure
  your `shift-back` produces a *logical* right-shift (zero fill),
  not an arithmetic one.

## 1. Shift back the bits

- `shift` takes a *signed* amount: a negative amount shifts right.
- For a positive value, `value amount neg shift` already gives the
  expected result.
- For a negative value, `shift` would sign-extend. Use `32 bits` first
  to reinterpret the value as a 32-bit unsigned integer, then shift:
  the result is non-negative and zero-fills naturally.

## 2. Set some bits

- A bit is set by ORing with a mask. `bitor` takes the two values
  off the stack and leaves the result.

## 3. Flip specific bits

- The exclusive-or of `value` and `mask` flips the bits where the
  mask is 1 and leaves the others alone. `bitxor` is the word.

## 4. Clear specific bits

- Plain `bitand` keeps bits that are 1 in both operands — the
  opposite of what you want. Flip the mask first with `bitnot`, then
  `bitand`.

[math]: https://docs.factorcode.org/content/vocab-math.html
[bitwise]: https://docs.factorcode.org/content/vocab-math.bitwise.html
