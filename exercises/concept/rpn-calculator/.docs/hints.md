# Hints

## General

- The calculator's stack is just a Factor array. An *operation* is a
  quotation `( stack -- new-stack )`.
- `head*` from [`sequences`][sequences] returns everything except
  the last `n` elements; `last2` returns the last two.

## 1. Implement addition

- Use `bi` from [`kernel`][kernel] to fork the input into two
  computations: "the array minus its last two elements" and "the
  sum of the last two elements". Then `suffix` joins them.

## 2. Implement multiplication

- Same shape as task 1 with `*` in place of `+`.

## 3. Apply a single operation

- The quotation's effect is `( stack -- new-stack )`. Declare that on
  `call` so the compiler can type-check it: `call( stack -- new-stack )`.

## 4. Evaluate a program

- `each` (in [`sequences`][sequences]) iterates a quotation over a
  sequence. Every iteration sees the running stack, pops the next
  operation off the program, and applies it.

## 5. Evaluate by name

- Look each name up in the assoc with `at` (in [`assocs`][assocs])
  to get its operation, then reuse `evaluate`.
- A fry quotation `'[ _ at ]` from [`curry-compose-fry`][fry]
  closes over the assoc so `map` can swap each name for its
  operation in one pass.

## 6. Divide with safety

- `throw` (in [`kernel`][kernel]) raises an error. `zero-divisor-error`
  is already declared, so `zero-divisor-error throw` is the call.
- Guard the divide path with an `if` that checks whether the
  bottom-most divisor is `0`.

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[assocs]: https://docs.factorcode.org/content/vocab-assocs.html
[fry]: https://docs.factorcode.org/content/vocab-fry.html
