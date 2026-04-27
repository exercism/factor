# Introduction

When you need a sequence of `n` values where each one depends on
its index, Factor gives you `<iota>` — a virtual sequence of the
integers `0, 1, …, n-1` — and `map`:

```factor
USING: math sequences ;

5 <iota> [ 2 * ] map .   ! => { 0 2 4 6 8 }
```

`<iota>` doesn't allocate the integers up front; `map` walks
through them in order, applying the quotation to each.

If the per-position result is a character code, `>string` turns
the result into a string — the natural way to assemble a row of
characters from index-driven decisions:

```factor
USING: strings ;

5 <iota> [ CHAR: a + ] map >string .   ! => "abcde"
```

[strings]: https://docs.factorcode.org/content/article-strings.html
