# Hints

## General

- `cond` in [`combinators`][combinators] is the cleanest way to map a
  speed to a success rate.
- The arithmetic words live in [`math`][math]; the float-to-integer
  helpers `floor` and `>integer` live in
  [`math.functions`][math.functions] and `math` respectively.

## 1. Calculate the success rate

- A `cond` clause is `{ [ predicate ] [ body ] }`. Each predicate
  inspects the speed but should leave the stack as it found it
  (a `dup` … `<test>` does that). The body usually starts with `drop`.
- Order matters: check `zero?` before `4 <=`, because `0 4 <=` is `t`.
- Use a final entry without a predicate as the default for speed `10`.

## 2. Calculate the production rate per hour

- Define `base-speed` as a `CONSTANT:` near the top of the file (just
  like `expected-bake-time` in `lasagna`).
- Compute `base-speed * speed * success-rate`. One option is to use
  `bi` from `kernel`: it runs two quotations on the same input and
  leaves both results on the stack.

## 3. Calculate the number of working items produced per minute

- Divide the hourly rate by 60.
- Use `floor` to drop the fractional part, then `>integer` to convert
  the float result into an integer.

[math]: https://docs.factorcode.org/content/vocab-math.html
[math.functions]: https://docs.factorcode.org/content/vocab-math.functions.html
[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
