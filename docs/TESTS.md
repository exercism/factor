# [The `tools.test` framework](http://docs.factorcode.org/content/vocab-tools.test.html)

Factor's built-in testing framework, rather like Factor itself, marries simplicity with unbridled power.

```
{ 1 } [ 1 ]             unit-test
{   } [ "Hello" print ] unit-test ! print doesn't leave anything on the stack
{ 3 } [ 1 2 + ]         unit-test
```

Assuming you've learned a little Factor by now, you will see that the `unit-test` word (which is actually a special syntax element) takes an array of how the stack should look after running a given quotation.

Word definitions should be concise and simplified. They should not be more than 5 or 10 lines long in most cases, and their inputs and outputs should be simple and clearly understandable. Importantly, a given word should do one thing and do it well.

Words written in this way will implicitly be easily `unit-test`able.

Unit tests (usually a bunch of assertions like above) go in a file called `vocab-name-tests.factor` beside your implementation `vocab-name.factor`. This file is already created for you by Exercism, but would normally need to be created by hand, or by `"exercise" scaffold-tests`.

The Factor track uses **Factor 0.101**. Each exercise ships with a small bundled `exercism-tools` vocabulary that defines `STOP-HERE` and `TASK:` parsing words and a test runner. To run an exercise's tests, change into the exercise directory and run:

```
factor -roots=. -run=exercism-tools <exercise-slug>
```

For example, to run the `annalyns-infiltration` tests:

```
cd annalyns-infiltration
factor -roots=. -run=exercism-tools annalyns-infiltration
```

The runner exits with status 0 when all tests pass, and non-zero with diagnostic output when any test fails.

For more information, see the Factor documentation on [Unit testing](http://docs.factorcode.org/content/article-tools.test.html).
