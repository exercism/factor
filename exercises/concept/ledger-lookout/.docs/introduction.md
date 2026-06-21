# Introduction

You already know the basics: character classes like `\d` and `[A-Z]`,
quantifiers like `{4}` and `+`, and the words `matches?`,
`all-matching-subseqs`, and `re-replace`. This exercise adds the parts
of regular expressions that describe *structure* and *context*. They
live in the same [`regexp`][regexp] vocabulary, written with the same
`R/ /` literal.

## Grouping and alternation

Round brackets `( )` group part of a pattern so that a quantifier — or
a `|` ("this **or** that") — applies to the whole group:

```factor
USING: regexp ;

"abab" R/ (ab)+/ matches? .                ! => t   (+ applies to "ab")
"dog"  R/ cat|dog/ matches? .              ! => t   (either word)
"$100.50" R/ \$\d+(\.\d{2})?/ matches? .   ! => t
"$100"    R/ \$\d+(\.\d{2})?/ matches? .   ! => t   (the group is optional)
```

The last pattern reads "a `$`, one or more digits, then an *optional*
group of a dot and two digits". Write `\$` for a literal dollar sign,
because a bare `$` is a special character (see anchors).

> Note: in Factor a group only *structures* the pattern. Unlike some
> regex tools, you cannot pull back out the text a group matched —
> there is no capture-group extraction, and back-references like `\1`
> are not supported. To pick text out *around* a landmark, use
> lookaround instead (below).

## Anchors

```
^    ! the start of the string
$    ! the end of the string
\b   ! a word boundary — the edge of a run of letters/digits
```

```factor
USING: regexp ;

"cat nap" R/ \bcat\b/ re-contains? .   ! => t
"scatter" R/ \bcat\b/ re-contains? .   ! => f   (cat sits inside a word)
```

## Lookaround — match by context, without consuming it

A *lookaround* checks what comes just before or just after the current
spot **without** making those characters part of the match. It is
"zero-width": what it tests is not included in the result.

```
(?=...)    ! lookahead:          ... must follow
(?!...)    ! negative lookahead: ... must NOT follow
(?<=...)   ! lookbehind:         ... must come before
```

```factor
USING: regexp ;

"spent $100 and $25" R/ (?<=\$)\d+/ all-matching-subseqs .
! => { "100" "25" }   (digits that follow a $; the $ is left out)

"up 5% then 12%" R/ \d+(?=%)/ all-matching-subseqs .
! => { "5" "12" }     (digits that come right before a %)
```

Lookaround is how you say "the part I want, recognised by what
surrounds it" — exactly what capture groups do elsewhere.

## Options

Add a letter after the closing `/` to change how the whole pattern
behaves. `i` makes it case-insensitive:

```factor
USING: regexp ;

"REFUND"  R/ refund/i matches? .       ! => t
"Refund"  R/ refund/i matches? .       ! => t
```

## Transforming each match

`all-matching-subseqs` hands you the matched text. `map-matches` goes a
step further — it runs a quotation on *each* match and collects the
results. The quotation receives the match's `start` index, its `end`
index, and the whole string; `subseq` turns those three into the
matched text, which you then transform:

```
map-matches ( string regexp quot: ( start end string -- obj ) -- seq )
```

```factor
USING: math regexp sequences ;

"a1 b22 c333" R/ \d+/ [ subseq length ] map-matches .
! => { 1 2 3 }     (the length of each run of digits)
```

Its side-effect-only cousin, [`each-match`][each-match], runs a
quotation on each match without collecting anything.

[regexp]: https://docs.factorcode.org/content/vocab-regexp.html
[each-match]: https://docs.factorcode.org/content/word-each-match%2Cregexp.html
