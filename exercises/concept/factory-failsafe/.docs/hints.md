# Hints

## General

- `throw` lives in [`kernel`][kernel]; `recover` lives in
  [`continuations`][continuations].

## 1. Check the humidity

- Compare with `>`, then run `[ "humidity too high" throw ] when` to
  fire the error only on the bad case.

## 2. Check the temperature

- Same shape as task 1 with `500` and a different message.

## 3. Define a custom error

- `ERROR: machine-error ;` declares the class *and* a constructor
  word that throws a fresh instance.

## 4. Monitor the machine

- Wrap each check in `[ check-… ] [ drop machine-error ] recover`.
  The recovery quotation drops the original error and throws a fresh
  `machine-error` — preserving the "either failure" semantics while
  hiding the original exception's identity.
- `bi*` from [`kernel`][kernel] applies one quotation to each input.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[continuations]: https://docs.factorcode.org/content/vocab-continuations.html
