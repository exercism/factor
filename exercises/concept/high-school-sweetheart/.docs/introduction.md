# Introduction

Factor's *function composition* is just the order you write words. A
word's body is itself a sequence of words: each one consumes some
values from the stack and pushes its result, and the next word picks
up where the previous left off. So defining

```factor
: firstletter ( name -- letter ) cleanupname first 1string ;
```

already *is* the composition of `cleanupname`, `first`, and `1string`.

This exercise also introduces **quotations** — Factor's term for an
anonymous, deferred sequence of words.

## Quotations

A quotation is a piece of code wrapped in square brackets. It doesn't
run when written; it sits on the stack as a value:

```factor
[ 2 * ] .       ! => [ 2 * ]
```

`call` runs a quotation:

```factor
3 [ 2 * ] call .    ! => 6
```

You write a quotation when you need to pass code as data: to be run
later, or to be passed to a *combinator* — a word that takes a
quotation as input.

## `compose`

`compose ( quot1 quot2 -- combined )` glues two quotations into one,
running them in the order written:

```factor
[ 2 * ] [ 1 + ] compose .    ! => [ 2 * 1 + ]
```

You'll usually find that defining a small word with `:` ... `;` reads
better than `compose`, but `compose` is handy when you need to build
quotations on the fly.

## Applying one quotation to two inputs

`bi@ ( x y quot -- ... )` runs the quotation on `x` and again on `y`,
leaving both results on the stack:

```factor
3 4 [ 2 * ] bi@ .s
! => 6
! => 8
```

The exercise's `couple` task takes two names; `bi@` is the natural way
to apply `initial` to each.

## A few string words

The exercise needs five small string words from the
[`sequences`][sequences] and [`splitting`][splitting] vocabularies:

- `replace ( seq old new -- new-seq )` — substring replace.
- `[ blank? ] trim` — drop leading/trailing whitespace (`blank?` from
  the `ascii` vocabulary).
- `1string ( char -- str )` — wrap a single character as a string.
- `>upper ( str -- upper )` — uppercase a string.
- `append ( s1 s2 -- s )` — concatenate two strings.
- `glue ( s1 s2 sep -- s )` — concatenate two strings with a separator
  between them.
- `surround ( seq pre post -- new )` — wrap a string with a prefix and
  a suffix.

Unicode characters can be written as `\u{XXXX}` inside a string, where
`XXXX` is the codepoint in hex. The heart `\u{2764}` (❤) appears in
this exercise.

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[splitting]: https://docs.factorcode.org/content/vocab-splitting.html
