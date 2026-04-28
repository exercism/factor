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

4 <iota> [ 2 * CHAR: A + ] map >string .   ! => "ACEG"
```

`CHAR: A` parses to the integer `65`. The quotation here doubles
the index and adds that base, which lands on every other capital
letter. Any arithmetic you stack on top of the index decides
what character ends up at that position.

## Choosing per position

When the character depends on a *condition* about the index, do
the choosing inside the quotation:

```factor
USING: kernel math sequences strings ;

5 <iota> [ 3 < [ CHAR: a ] [ CHAR: b ] if ] map >string .
! => "aaabb"
```

The first three positions test `i 3 <` as `t`, so they get `a`;
the rest get `b`. The same shape — `[ <test> [ <yes> ] [ <no> ]
if ]` — covers parity tests with `even?` / `odd?` (in
[`math`][math]) and "every k-th position" tests with `mod` and
`zero?`.

[sequences]: https://docs.factorcode.org/content/article-sequences.html
[strings]: https://docs.factorcode.org/content/article-strings.html
[math]: https://docs.factorcode.org/content/vocab-math.html
