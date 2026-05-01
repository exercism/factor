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

## Bounded ranges

When the index range doesn't start at `0`, or you want it
inclusive at both ends, the [`ranges`][ranges]
vocabulary provides bracket-notation literals. Square brackets
include the endpoint; round brackets exclude it.

```
[a..b]    ! a, a+1, …, b      (inclusive)
[a..b)    ! a, a+1, …, b-1    (half-open at the top)
```

```factor
USING: math ranges sequences ;

3 7 [a..b] [ 2 * ] map .   ! => { 6 8 10 12 14 }
3 7 [a..b) [ 2 * ] map .   ! => { 6 8 10 12 }
```

A few common one-arg shorthands:

```
[1..b]    ! 1, 2, …, b        (same as 1 b [a..b])
[1..b)    ! 1, 2, …, b-1      (same as 1 b [a..b))
[0..b)    ! 0, 1, …, b-1      (same as 0 b [a..b), and same as `b <iota>`)
```

```factor
6 [1..b] [ sq ] map .      ! => { 1 4 9 16 25 36 }
6 [1..b) [ sq ] map .      ! => { 1 4 9 16 25 }
4 [0..b) [ 1 + ] map .     ! => { 1 2 3 4 }
```

`<iota>` is the most common form; `[a..b]` and friends are the
right tool when the range starts somewhere other than `0` or
needs an inclusive upper bound.

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
[ranges]: https://docs.factorcode.org/content/vocab-ranges.html
