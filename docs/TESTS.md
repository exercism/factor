# Running the tests

When you download an exercise, Exercism saves it as a self-contained folder, for example `~/exercism/factor/hello-world`. That folder holds a sub-folder with your solution and another with the test runner:

```
hello-world/
├── hello-world/
│   ├── hello-world.factor        <- your solution
│   └── hello-world-tests.factor  <- the tests
└── exercism-tools/               <- the bundled test runner
```

`cd` into the top of that folder and run the tests with:

```
factor -roots=. -run=exercism-tools <exercise>
```

Replace `<exercise>` with the exercise's name (the same name as the folder). For example, to test `hello-world`:

```
cd ~/exercism/factor/hello-world
factor -roots=. -run=exercism-tools hello-world
```

Run the command from the top of the exercise folder — the directory that holds both the `<exercise>` and `exercism-tools` sub-folders.

These are the same tests Exercism runs when you submit, so once they all pass locally you are ready to submit.

## One test at a time

Each exercise starts with only its first test active. The remaining tests are held back by a `STOP-HERE` line in the `<exercise>-tests.factor` file; the runner ignores everything below it.

```
"year not divisible by 4 in common year" description
{ f } [ 2015 leap-year? ] unit-test

STOP-HERE

"year divisible by 2, not divisible by 4 in common year" description
{ f } [ 1970 leap-year? ] unit-test
```

Get the first test passing, then move `STOP-HERE` down past the next test (or delete it to enable them all) and run the tests again. Work through the file this way until every test passes.

When you submit, Exercism's runner ignores `STOP-HERE` and runs every test, so make sure they all pass before submitting.

## When tests pass

The runner prints each test it ran and exits quietly:

```
Unit Test: { { f } [ 2015 leap-year? ] }
```

## When a test fails

The runner shows the test, then the value it expected versus the value your code produced:

```
Unit Test: { { f } [ 2015 leap-year? ] }
--> test failed!
###FAIL_BEGIN###
leap/leap-tests.factor: 5
=== Expected:
f
=== Got:
t
###FAIL_END###
```

Here the test ran `2015 leap-year?` and expected `f` on the stack, but got `t`.

## Reading a test

Tests are written with `unit-test`, which takes an array describing what the stack should look like after running a quotation:

```
{ 3 } [ 1 2 + ] unit-test
```

This runs `[ 1 2 + ]` and checks that it leaves `3` on the stack. An empty array, `{ }`, means the quotation should leave the stack empty. The optional `description` line above a test simply gives it a readable name.

For more detail, see the Factor documentation on [unit testing][unit-testing].

[unit-testing]: https://docs.factorcode.org/content/article-tools.test.html
