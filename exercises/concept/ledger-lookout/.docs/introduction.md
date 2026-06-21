# Introduction

You already know the basics: character classes like `\d` and `[A-Z]`,
quantifiers like `{4}` and `+`, and the words `matches?`,
`all-matching-subseqs`, and `re-replace`. This exercise adds the parts
of regular expressions that describe *structure* and *context*. They
live in the same [`regexp`][regexp] vocabulary, written with the same
`R/ /` literal.

## Anchors

Anchors match a *position* rather than a character:

```
^    ! the start of the string
$    ! the end of the string
\b   ! a word boundary
```

Because `$` means the end of the string, write `\$` when you mean a
literal dollar sign.

A *word boundary* (`\b`) is the spot where a *word character* meets a
non-word one. Word characters are letters, digits, and the underscore;
everything else — spaces, punctuation, and the two ends of the
string — counts as a boundary. So `\bcat\b` matches `cat` only when it
stands on its own:

```factor
USING: regexp ;

"cat nap" R/ \bcat\b/ re-contains? .   ! => t
"scatter" R/ \bcat\b/ re-contains? .   ! => f   (cat sits inside a word)
```

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

The last pattern reads "a dollar sign, one or more digits, then an
*optional* group of a dot and two digits".

> Note: in Factor a group only *structures* the pattern. Unlike some
> regex tools, you cannot pull back out the text a group matched —
> there is no capture-group extraction, and back-references like `\1`
> are not supported. To pick text out *around* a landmark, use
> lookaround instead (below).

## Lookaround — match by context, without consuming it

A *lookaround* checks what comes just before or just after the current
spot **without** making those characters part of the match. It is
"zero-width": what it tests is not included in the result.

```
(?=...)    ! lookahead:           ... must follow
(?!...)    ! negative lookahead:  ... must NOT follow
(?<=...)   ! lookbehind:          ... must come before
(?<!...)   ! negative lookbehind: ... must NOT come before
```

Lookaround is *selective* — the same characters match or not depending
on what sits beside them. A plain `\d+` grabs every number; the lookbehind
and lookahead keep only those with the right neighbour:

```factor
USING: regexp ;

"3 for $10 or 10 for $30" R/ \d+/ all-matching-subseqs .
! => { "3" "10" "10" "30" }   (every number)

"3 for $10 or 10 for $30" R/ (?<=\$)\d+/ all-matching-subseqs .
! => { "10" "30" }            (only the prices — the bare 3 and 10 drop)

"buy 2 at 15% off, 4 at 30% off" R/ \d+(?=%)/ all-matching-subseqs .
! => { "15" "30" }            (only the discounts — the bare 2 and 4 drop)
```

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
