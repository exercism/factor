# About

Beyond character classes and quantifiers, regular expressions can
describe the *structure* and *context* of text. These features live in
the same [`regexp`][regexp] vocabulary, written with the `R/ /`
literal.

## Grouping and alternation

Round brackets `( )` group part of a pattern so a quantifier or a `|`
("this or that") applies to the whole group. `?` after a group makes it
optional:

```factor
USING: regexp ;

"abab"    R/ (ab)+/ matches? .             ! => t
"cat"     R/ cat|dog/ matches? .           ! => t
"$100.50" R/ \$\d+(\.\d{2})?/ matches? .   ! => t
"$100"    R/ \$\d+(\.\d{2})?/ matches? .   ! => t   (group optional)
```

## Anchors

```
^    ! start of the string
$    ! end of the string
\b   ! a word boundary
```

A *word boundary* (`\b`) is where a word character (a letter, digit, or
underscore) meets a non-word one, including the ends of the string. So
`\bcat\b` matches `cat` only when it stands on its own:

```factor
USING: regexp ;

"cat nap" R/ \bcat\b/ re-contains? .   ! => t
"scatter" R/ \bcat\b/ re-contains? .   ! => f
```

## Lookaround

A *lookaround* tests what comes just before or after a spot without
making those characters part of the match — it is zero-width:

```
(?=...)    ! lookahead
(?!...)    ! negative lookahead
(?<=...)   ! lookbehind
```

```factor
USING: regexp ;

"spent $100 and $25" R/ (?<=\$)\d+/ all-matching-subseqs .
! => { "100" "25" }

"up 5% then 12%" R/ \d+(?=%)/ all-matching-subseqs .
! => { "5" "12" }
```

## Options

An option letter after the closing `/` changes the whole pattern.
`i` is case-insensitive:

```factor
USING: regexp ;

"REFUND" R/ refund/i matches? .   ! => t
```

## Transforming each match

`map-matches` runs a quotation on every match and collects the
results; `each-match` does the same for side effects only. Both pass
the quotation the match's `start` index, `end` index, and the whole
string, so `subseq` recovers the matched text:

```
map-matches ( string regexp quot: ( start end string -- obj ) -- seq )
each-match  ( string regexp quot: ( start end string --     ) --     )
```

```factor
USING: math regexp sequences ;

"a1 b22 c333" R/ \d+/ [ subseq length ] map-matches .
! => { 1 2 3 }
```

## What Factor does not support

Factor's regexp engine has no **capture-group extraction** (a group
`( )` structures the pattern but you cannot read back the text it
matched), no **back-references** (`\1`), and no **lazy/non-greedy**
quantifiers (`*?`, `+?`). Lookaround is the idiomatic substitute for
capture groups: match the part you want, recognised by the context
around it.

[regexp]: https://docs.factorcode.org/content/vocab-regexp.html
