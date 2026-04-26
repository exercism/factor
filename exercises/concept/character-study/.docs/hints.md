# Hints

## General

- Characters in Factor are integers (Unicode code points), so
  numeric `<`, `>`, `=` work directly.
- Predicates and case conversion live in [`unicode`][unicode].
- The symbols you return (`less`, `big`, `alpha`, ...) need to be
  declared before use; group them with `SYMBOLS: ... ;`.

## 1. Compare two characters

- Use `<` and `>` from [`math`][math].
- Wrap the three cases with `cond` from [`combinators`][combinators].

## 2. Determine the size

- `LETTER?` is the uppercase predicate, `letter?` the lowercase
  one.

## 3. Change the size

- `ch>upper` and `ch>lower` are the per-character converters
  (string-level `>upper`/`>lower` exist too, but you have a single
  character here).

## 4. Determine the type

- Order matters in your `cond`. `Letter?` matches upper *or*
  lower, so it should run before any case-specific test.

[unicode]: https://docs.factorcode.org/content/vocab-unicode.html
[math]: https://docs.factorcode.org/content/vocab-math.html
[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
