# Hints

## General

- `unparse` is in [`prettyprint`][prettyprint]; the slice variants
  are in [`sequences`][sequences]; the multi-input cleave family
  is in [`combinators`][combinators].

## 1. Quote a value

- One word: `unparse`.

## 2. Strip the flag framing

- Drop the leading marker with `1 tail-slice`, then drop the
  trailing marker with `1 head-slice*`.

## 3. Split a flag

- Both `head-slice` and `tail-slice` need the flag *and* the
  header length on the stack. That's `[ head-slice ] [ tail-slice ]
  2bi`.

## 4. Triangulate from two readings

- Three different quotations, each taking the same two readings:
  `[ - ] [ + 2 / ] [ / ] 2tri`.

## 5. Summarise three readings

- Three quotations of three inputs each: `3tri`. The summing
  quotation is `[ + + ]`; the product is `[ * * ]`; the maximum
  is `[ max max ]`.

[prettyprint]: https://docs.factorcode.org/content/vocab-prettyprint.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
