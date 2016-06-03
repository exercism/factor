# xfactor

Exercism problems in Factor.

We :heart: pull requests, issues and suggestions.

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data).

## Working on the Exercises

We welcome both improvements to the existing exercises and new exercises.
A pool of exercise ideas can be found in the [x-common repo](https://github.com/exercism/x-common).

If you do contribute, please try to follow the guidelines for Factor code in this repo:

* Factor code should run in both the latest stable Factor as well as the latest nightly Factor. This is not a very hard requirement to meet, since Factor is very stable. If something only works in a certain version, find a different way.

* Code should strictly follow the [Factor code conventions](http://docs.factorcode.org/content/article-conventions.html). This is also not a very hard task, and makes reading and writing code much easier.

* Code should compile and pass all of its unit tests, including the `exercism-testing` vocabulary itself.

## Get set up with using Factor to run and test the exercise code

Here's what you need to do to start working with the Factor code in the `exercises` directory.

1. Make Factor know about the `xfactor/exercises` and `xfactor/tests` directories and the vocabs (i.e. subdirectories) inside them. There are [a few ways](http://docs.factorcode.org/content/article-add-vocab-roots.html) to do this; the easiest way is by setting the `FACTOR_ROOTS` environment variable.

2. Make sure your setup works: `source` your `.bashrc` or equivalent (or logout and back in), then start the Factor Listener and run:
  ```factor
  USE: vocabs.loader vocab-roots get .
  ```
  It should print something like:

  ```factor
  V{
      "resource:core"
      "resource:basis"
      "resource:extra"
      "resource:work"
      "/home/you/exercism/factor"
      "/home/you/git/exercism-stuff/xfactor/exercises"
  }
  ```
  Ensure it includes the directories you added to your `FACTOR_ROOTS` variable _or_ the directories you specified in one of the configuration files.

3. Test an exercise's example code with:
  ```
  xfactor (master) $ factor -run=exericsm-testing hello-world
  config.json OK

  testing exercise: hello-world

  Unit Test: { { "Hello, World!" } [ "" hello-you ] }
  Unit Test: { { "Hello, Alice!" } [ "Alice" hello-you ] }
  Unit Test: { { "Hello, Bob!" } [ "Bob" hello-you ] }
  ```

  Alternatively, to run all tests in all exercise directories:

  ```
  xfactor (master) $ factor -run=exericsm-testing run-all
  config.json OK

  testing exercise: hello-world

  Unit Test: { { "Hello, World!" } [ "" hello-you ] }
  Unit Test: { { "Hello, Alice!" } [ "Alice" hello-you ] }
  Unit Test: { { "Hello, Bob!" } [ "Bob" hello-you ] }
  ```

  `config.json` is verified for logical integrity on each run. To only check `config.json`'s validity:
  ```
  xfactor (master) $ factor -run=exericsm-testing VERIFY
  config.json OK
  ```
  If `config.json` is invalid, then an error will be thrown and tests will not run.

  Check out `exercism-testing`'s documentation for more information.

4. To develop `exercism-testing`, just `USE: exercism-testing \ run-exercism-test edit`.

## Working on the Documentation

If you think you've found a factual or technical error, or you just have a question or suggestion about some part of the Markdown or Factor documentation, we'd :heart: you to open an issue or pull request.

## License

The MIT License (MIT)

Copyright (c) 2016 Katrina Owen, _@kytrinyx.com

