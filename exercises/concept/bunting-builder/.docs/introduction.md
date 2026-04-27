# Introduction

When you need a row of `n` values where each one depends on its
position, Factor's `<iota>` and `map` cooperate to do the job
without writing a loop counter.

## `<iota>` and `map`

`<iota>` (in [`sequences`][sequences]) takes a non-negative
integer `n` and returns a *virtual* sequence of the integers
`0, 1, …, n-1`. `map` then walks it, applying your quotation to
each element:

```factor
USING: math sequences ;

5 <iota> [ 2 * ] map .   ! => { 0 2 4 6 8 }
```

The quotation receives one integer — the index — and leaves the
value for that position on the stack.

## Building a string by position

`map` yields whatever shape its quotation returns. If the
quotation leaves a character code on the stack, `>string` (in
[`strings`][strings]) turns the result into a string:

```factor
USING: math sequences strings ;

5 <iota> [ CHAR: a + ] map >string .   ! => "abcde"
```

`CHAR: a` parses to the integer `97`. Adding the index gives
`97`, `98`, `99`, …, which `>string` reads as the characters
`a`, `b`, `c`, …. Index `0` becomes `a`, index `25` becomes `z`.

## Choosing per position

When the character depends on a *condition* about the index, do
the choosing inside the quotation:

```factor
USING: kernel math sequences strings ;

8 <iota> [ even? [ CHAR: O ] [ CHAR: . ] if ] map >string .
! => "O.O.O.O."
```

`mod` (in [`math`][math]) is the usual companion when "every
k-th position" matters:

```factor
9 <iota> [ 3 mod zero? [ CHAR: | ] [ CHAR: - ] if ] map >string .
! => "|--|--|--"
```

[sequences]: https://docs.factorcode.org/content/article-sequences.html
[strings]: https://docs.factorcode.org/content/article-strings.html
[math]: https://docs.factorcode.org/content/vocab-math.html
