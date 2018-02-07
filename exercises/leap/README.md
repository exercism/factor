# Leap

Given a year, report if it is a leap year.

The tricky thing here is that a leap year in the Gregorian calendar occurs:

```text
on every year that is evenly divisible by 4
  except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400
```

For example, 1997 is not a leap year, but 1996 is.  1900 is not a leap
year, but 2000 is.

If your language provides a method in the standard library that does
this look-up, pretend it doesn't exist and implement it yourself.

## Notes

Though our exercise adopts some very simple rules, there is more to
learn!

For a delightful, four minute explanation of the whole leap year
phenomenon, go watch [this youtube video][video].

[video]: http://www.youtube.com/watch?v=xX96xng7sAE

## Testing Exercises

If you followed the [installation instructions](http://exercism.io/languages/factor/installing), just run the provided test suite against your implementation with `"exercise-name" test`.

## Submitting Exercises

Note that, when trying to submit an exercise, make sure the solution is in the `exercism/factor/exercise-name` directory.

For example, if you're submitting `bob.factor` for the Bob exercise, the submit command would be something like `exercism submit exercism/factor/bob/bob.factor`.

For more detailed information about running tests, code style and linting,
please see the [help page](http://exercism.io/languages/factor).
## Source

JavaRanch Cattle Drive, exercise 3 [http://www.javaranch.com/leap.jsp](http://www.javaranch.com/leap.jsp)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
