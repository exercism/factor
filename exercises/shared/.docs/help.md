# Help

## Running the tests

The Factor track uses **Factor 0.101**. After
[installing it](https://exercism.org/docs/tracks/factor/installation),
run from this exercise's directory:

```
factor -roots=. -run=exercism-tools <exercise-slug>
```

For example, for `annalyns-infiltration`:

```
factor -roots=. -run=exercism-tools annalyns-infiltration
```

Each exercise ships a small bundled `exercism-tools` vocabulary
that drives the test run. The runner exits with status 0 when
every test passes, and with non-zero status plus diagnostic
output if any test fails.

### Skipped tests

By default, only the first test runs. The mechanism is the
`STOP-HERE` line in the test file: at parse time it tells
Factor's lexer to ignore everything below it, so the runner
only sees the tests above. Once your first test passes, you can
enable more tests in two ways:

- **Delete the `STOP-HERE` line** to enable every remaining
  test at once.
- **Move the `STOP-HERE` line further down** to enable tests
  one at a time, or one task at a time. Concept exercises group
  their tests under `TASK:` markers — moving `STOP-HERE` to
  just before the next `TASK:` is a natural step.

When all tests pass, you've solved the exercise.

## Submitting your solution

From the exercise's directory:

```
exercism submit <exercise-slug>/<exercise-slug>.factor
```

For example:

```
exercism submit annalyns-infiltration/annalyns-infiltration.factor
```

If the exercise's `.meta/config.json` lists more than one
solution file (some concept exercises split a solution across a
helper sub-vocabulary), pass every file you edited to
`exercism submit`.

## Submitting incomplete solutions

You can submit a solution even with failing tests — that lets
you see how others have approached the exercise, and ask for
mentor feedback on whatever you have so far.

## Getting more help

- The [Factor category on the Exercism forum](https://forum.exercism.org/c/programming/factor/)
  is the best place for track-specific questions and feedback.
- The [Exercism Discord](https://exercism.org/r/discord) has
  channels for both general help and individual tracks.
- [Factor's official documentation](https://docs.factorcode.org/)
  is searchable and exhaustive. Two good entry points:
  - [The Factor handbook](https://docs.factorcode.org/content/article-handbook.html)
    — reference-style, organised by vocabulary.
  - [The Factor cookbook](https://docs.factorcode.org/content/article-cookbook.html)
    — short, idiomatic examples by topic.
- Andrea Ferretti's
  [Factor tutorial](https://andreaferretti.github.io/factor-tutorial/)
  is a fast, friendly introduction to the language and the
  development environment.
