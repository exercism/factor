# Hints

## General

- You will need to define a constant and three words that operate on
  the stack.
- The arithmetic words `+`, `-`, and `*` all live in the `math`
  vocabulary. Add `math` to your `USING:` line.

## 1. Store the expected bake time in a constant

- Use `CONSTANT:` to define `expected-bake-time` near the top of the
  file, above the word definitions.

## 2. Calculate the preparation time in minutes

- Use `*` with stack effect `( x y -- product )` to multiply the number
  of layers by `2`.

## 3. Calculate the remaining oven time in minutes

- Push `expected-bake-time` and then subtract the current time.
- Remember that `-` computes `deeper - top`. If you push values in the
  order `current-time`, `expected-bake-time`, you will need `swap` to
  get the subtraction the right way around.

## 4. Calculate the total working time in minutes

- Reuse the `preparation-time` word you defined in task 2.
- Only one of the two inputs should go to `preparation-time`; the other
  should be added to the result.
