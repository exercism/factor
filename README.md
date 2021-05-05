# Exercism Factor Track

---

[![Configlet Status](https://github.com/exercism/factor/workflows/configlet/badge.svg)]

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

* Code should compile and pass all of its unit tests, tested using [exercism.testing](https://github.com/catb0t/exercism.testing).

## Get set up with using Factor to run and test the exercise code

Here's what you need to do to start working with the Factor code in the `exercises` directory.

1. Download [exercism.testing](https://github.com/catb0t/exercism.factor) and put it somewhere Factor can find it. Your `resource:work` directory is a good choice, so `testing.factor` is `resource:work/exercism/testing/testing.factor`.

2. Test an exercise's example code with:
  ```
  factor (master) $ factor -run=exericsm.testing hello-world
  working directory OK: /home/you/git/factor is a dev-env
  config.json and exercises OK

  testing exercise: hello-world

  Unit Test: { { "Hello, World!" } [ say-hello ] }
  ```

  Alternatively, to run all tests in all exercise directories:

  ```
  factor (master) $ factor -run=exericsm.testing run-all
  working directory OK: /home/you/git/factor is a dev-env
  config.json and exercises OK

  testing exercise: hello-world

  Unit Test: { { "Hello, World!" } [ say-hello ] }
  ```

  `config.json` is verified for logical integrity on each run. To only check `config.json`'s validity:
  ```
  factor (master) $ factor -run=exericsm.testing VERIFY
  working directory OK: /home/you/git/factor is a dev-env
  config.json and exercises OK
  ```
  If `config.json` is invalid, then an error will be thrown and tests will not run.

  Check out `exercism-testing`'s documentation for more information.

4. Find a bug, or have a question or comment about `exercism.testing`? [Open an issue](https://github.com/catb0t/exericsm.factor/issues) or [pull request](https://github.com/catb0t/exericsm.factor/pulls)!

## Working on the Documentation

If you think you've found a factual or technical error, or you just have a question or suggestion about some part of the Markdown or Factor documentation, we'd :heart: you to open an issue or pull request.

### [Factor icon](https://github.com/exercism/factor/tree/master/img/icon.png)

The Factor "Tyrannosaurus Rex" logo is owned by John Benediktsson. We have adapted it, changing the colour scheme, with his permission.
