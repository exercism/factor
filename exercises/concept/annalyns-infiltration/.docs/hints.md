# Hints

## General

- The three boolean words — `and`, `or`, and `not` — all live in the
  `kernel` vocabulary and are already available without a `USING:` line.
- Factor is concatenative: arguments are consumed from the stack in the
  order they were pushed. If you need to combine two values in the "wrong"
  order, use `swap`.

## 1. Fast attack

- `not` inverts a boolean, which is exactly what you need to turn
  "the knight is awake" into "the knight is asleep".

## 2. Spy

- `or` applied to two values is true when at least one is true.
- `or` combines just two inputs at a time, but it composes: chaining
  two `or`s is fine when you need to check three values.

## 3. Signal prisoner

- You need `prisoner-awake AND (NOT archer-awake)`.
- `archer-awake` sits deeper on the stack than `prisoner-awake` when the
  word is entered. Consider whether a `swap` helps you apply `not` to the
  right value.

## 4. Free prisoner

- The success condition is an `or` of two sub-expressions.
- Each sub-expression is an `and` of several negated and/or plain
  booleans — you may find it clearest to write the word using
  locals (`::` and named parameters) rather than juggling the stack.
