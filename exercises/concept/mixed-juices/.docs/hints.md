# Hints

## 1. Time to mix a juice

- `cond` (in [`combinators`][combinators]) is the cleanest way to
  pick a value based on a chain of equality tests.

## 2. Replenish the lime wedge supply

- A `while` loop with two pieces of state — wedges still needed,
  and limes still on hand — is the natural fit. Declaring those
  with `::` and `:> name!` keeps the body readable.
- `unclip ( seq -- rest first )` peels off the first lime, ready
  to feed to `wedges-from-lime`.

## 3. List the times to mix each order in the queue

- One word from [`sequences`][sequences] does the whole job.

## 4. Finish up the shift

- The shape is the same as Task 2: a `while` loop driven by two
  pieces of state — minutes left in the shift, and orders still
  waiting. Stop as soon as either has run out.

[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
