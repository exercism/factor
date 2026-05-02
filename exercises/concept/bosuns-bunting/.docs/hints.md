# Hints

## General

- `n <iota>` produces a virtual sequence of the integers
  `0, 1, …, n-1`.
- `map` (in [`sequences`][sequences]) runs your quotation on each
  element and collects the results.
- `>string` (in [`strings`][strings]) turns a sequence of
  character codes into a string.

## 1. Alphabet bunting

- `CHAR: a` parses to the integer `97`. Adding the index `i`
  gives the code for the `i`-th lowercase letter.

## 2. Counting bunting

- `mod` (in [`math`][math]) returns the remainder of integer
  division.
- The character codes for digits are consecutive — `CHAR: 0`,
  `CHAR: 1`, … — so `CHAR: 0 +` flips an integer in `0..9` to
  the matching digit character.

## 3. Stripe bunting

- `even?` (in [`math`][math]) is `t` for even integers, `f`
  otherwise.
- Inside the `map` quotation, `if` picks one of two character
  literals based on the test.

## 4. Marker bunting

- `5 mod zero?` is `t` exactly at positions `0`, `5`, `10`, … .

## 5. Valley bunting

- `-5 5 [a..b)` (in [`ranges`][ranges]) is the half-
  open range `-5, -4, …, 4`.
- `abs` (in [`math`][math]) flips a negative integer to its
  positive counterpart, leaving non-negative integers alone.

[sequences]: https://docs.factorcode.org/content/article-sequences.html
[strings]: https://docs.factorcode.org/content/article-strings.html
[math]: https://docs.factorcode.org/content/vocab-math.html
[ranges]: https://docs.factorcode.org/content/vocab-ranges.html
