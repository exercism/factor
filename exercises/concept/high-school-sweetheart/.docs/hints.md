# Hints

## General

- The string words you'll need live in [`splitting`][splitting] and
  [`sequences`][sequences]; `blank?` is in `ascii`. Update your
  `USING:` line as you go.

## 1. Clean up the name

- `replace ( seq old new -- new-seq )` does substring replacement.
- `[ blank? ] trim` strips leading and trailing whitespace.

## 2. Get the name's first letter

- After `cleanupname`, take the first character with `first`, then
  wrap it in a one-character string with `1string`.

## 3. Format the first letter as an initial

- Use `>upper` (in `ascii`) to uppercase the letter, then `append` a
  `"."` to the end.

## 4. Put the initials inside of the heart

- `bi@ ( x y quot -- ... )` is the natural way to apply `initial` to
  both names with a single combinator call: `[ initial ] bi@`.
- After `bi@` you have the two initials on the stack. Join them with a
  separator using `glue`, and wrap the result with the heart prefix
  and suffix using `surround`.
- The heart character is `\u{2764}` inside a Factor string literal.

[splitting]: https://docs.factorcode.org/content/vocab-splitting.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
