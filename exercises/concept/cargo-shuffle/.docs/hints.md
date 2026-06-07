# Hints

## General

- Every task is a single word whose body is made up of shuffle words
  from the `kernel` vocabulary — no arithmetic is needed.
- Use `.s` at the listener to print the whole stack while you
  experiment.

## 1. Swap the top two crates

- A single shuffle word flips the top two values: `swap`.

## 2. Clear the spilled crate

- `drop` removes the top value; the two crates underneath are left
  untouched.

## 3. Keep a copy of the crate underneath

- `over` copies the second-from-top value onto the top.

## 4. Tidy the deck

- Bring the bottom crate to the top with `rot`, throw it away with
  `drop`, duplicate the new top with `dup`, then `rot` again to put the
  pieces in order. Trace the stack one word at a time:
  `x y z` → `y z x` → `y z` → `y z z` → `z z y`.
