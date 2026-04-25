# Hints

## General

- All three tasks need to break the log line apart. The
  [`splitting`][splitting] vocabulary is the right starting point.
- For the trim helper you'll need `blank?` from `ascii` and `trim`
  from [`sequences`][sequences].

## 1. Get message from a log line

- Cut the line on `": "` with `split1` (stack effect
  `( seq subseq -- before after )`); discard the part before, keep
  the part after.
- Strip whitespace from what's left with `[ blank? ] trim`.

## 2. Get log level from a log line

- Splitting on the bracket characters with `"[]" split` gives you
  three pieces: `""`, the level, and the rest of the line.
- `harvest` (from [`sequences`][sequences]) drops the empty piece.
- Take the first remaining element and call `>lower` on it.

## 3. Reformat a log line

- Reuse `message` and `log-level`. `bi` from `kernel` runs two
  quotations on the same input and leaves both results on the stack.
- Wrap the level in parentheses with `surround`.
- Join the message and the parenthesised level with `glue`, using
  a single space as the separator.

[splitting]: https://docs.factorcode.org/content/vocab-splitting.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
