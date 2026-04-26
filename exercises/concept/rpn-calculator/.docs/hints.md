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

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
