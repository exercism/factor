# [The `tools.test` framework](http://docs.factorcode.org/content/vocab-tools.test.html)

Factor has a very simple, yet very powerful (like Factor itself) test framework in its standard library.

```
{ 1 } [ 1 ]             unit-test
{   } [ "Hello" print ] unit-test ! print doesn't leave anything on the stack
{ 3 } [ 1 2 + ]         unit-test
```

Now, assuming you've learned a little Factor by now, you will see that the `unit-test` word (which is actually a special syntax element) takes an array of how the stack should look after running the given quotation. See `exercism-testing/exercism-testing-docs.factor` for more examples of unit tests.

Words should be concise and simplified. They should not be more than 5 or 10 lines long in most cases, and their inputs and outputs should be simple and clearly understandable. Importantly, a given word should do one thing and do it well. Consequently, a given word should be easily `unit-test`able.

Unit tests (a bunch of assertions like above) go in a file called `vocab-name-tests.factor` which is already created for you by Exercism, but would need to be created by hand or `"exercise" scaffold-tests`. Run a vocabulary's tests from the listener with `"exercise-name" test`, or from the command-line with `factor -run=exercism-testing exercise-name`.

For more information, see the Factor documentation on [Unit testing](http://docs.factorcode.org/content/article-tools.test.html).