# {{ .Spec.Name }}

{{ .Spec.Description -}}
{{- with .Hints }}
{{ . }}
{{ end }}
## Running the tests

The Factor track uses **Factor 0.101**. Make sure you have it [installed](http://exercism.io/languages/factor/installation), then change into the exercise's top-level directory and run:

```
factor -roots=. -run=exercism-tools <exercise-slug>
```

For example, for the `annalyns-infiltration` exercise:

```
cd annalyns-infiltration
factor -roots=. -run=exercism-tools annalyns-infiltration
```

Each exercise ships with a small bundled `exercism-tools` vocabulary. The runner exits with status 0 when all tests pass, and non-zero with diagnostic output when any test fails.

In some exercises a `STOP-HERE` line in the test file truncates the suite to the first test. Once you have that test passing, delete the `STOP-HERE` line to reveal the rest.

## Submitting Exercises

Note that, when trying to submit an exercise, make sure the solution is in the `exercism/factor/<exercise-slug>` directory.

For example, if you're submitting `bob.factor` for the Bob exercise, the submit command would be something like `exercism submit exercism/factor/bob/bob/bob.factor`.{{ with .Spec.Credits }}
## Source

{{ . }}
{{ end }}
## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
