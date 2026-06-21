# Introduction

Beyond character classes and quantifiers, regular expressions can
describe *structure* and *context*. These features live in the same
[`regexp`][regexp] vocabulary and the same `R/ /` literal.

Round brackets `( )` group part of a pattern so a quantifier or a `|`
("this or that") applies to the whole group; `?` after a group makes it
optional:

```factor
USING: regexp ;

"abab"    R/ (ab)+/ matches? .             ! => t
"$100"    R/ \$\d+(\.\d{2})?/ matches? .   ! => t   (optional group)
```

Anchors pin a pattern to a position: `^` (start), `$` (end), and `\b`
(a word boundary).

A *lookaround* matches by what surrounds a spot without consuming it:

```
(?=...)    ! lookahead — ... must follow
(?!...)    ! negative lookahead — ... must not follow
(?<=...)   ! lookbehind — ... must come before
```

```factor
USING: regexp ;

"spent $100 and $25" R/ (?<=\$)\d+/ all-matching-subseqs .
! => { "100" "25" }

"up 5% then 12%" R/ \d+(?=%)/ all-matching-subseqs .
! => { "5" "12" }
```

An option letter after the closing `/` changes the whole pattern;
`i` makes it case-insensitive:

```factor
USING: regexp ;

"REFUND" R/ refund/i matches? .   ! => t
```

Factor uses lookaround in place of capture groups: it has no
capture-group extraction, back-references, or lazy quantifiers.

[regexp]: https://docs.factorcode.org/content/vocab-regexp.html
