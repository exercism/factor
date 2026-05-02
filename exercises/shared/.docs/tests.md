# Tests

The Factor track uses **Factor 0.101**. Each exercise ships with a bundled `exercism-tools` vocabulary that defines `STOP-HERE` and `TASK:` parsing words plus a test runner. From the exercise's directory, run:

```
factor -roots=. -run=exercism-tools <exercise-slug>
```

For example, for the `annalyns-infiltration` exercise:

```
factor -roots=. -run=exercism-tools annalyns-infiltration
```

The runner exits with status 0 when all tests pass, and non-zero with diagnostic output when any test fails.

## Skipped tests

Solving an exercise means making all its tests pass.
By default, only one test (the first one) is executed when you run the tests.
This is intentional, as it allows you to focus on just making that one test pass.

The mechanism is the `STOP-HERE` line in the test file: at parse time it tells Factor to ignore everything below it, so the runner only sees the tests above. Once your first test passes, you can enable more tests in two ways:

- **Delete the `STOP-HERE` line** to enable every remaining test at once.
- **Move the `STOP-HERE` line further down** to enable tests one at a time, or one task at a time. Concept exercises group tests under `TASK:` markers — moving `STOP-HERE` just before the next `TASK:` is a natural step.

When all tests have been enabled and your implementation makes them all pass, you'll have solved the exercise!
