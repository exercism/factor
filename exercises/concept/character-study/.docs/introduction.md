# Introduction

Factor characters are integers — Unicode code points — so numeric
`<`, `>`, `=` give you case-sensitive ordering directly. The
[`unicode`][unicode] vocabulary adds Unicode-aware predicates and
single-character case conversion.

## Character predicates

```
LETTER?  ( c -- ? )    ! uppercase letter
letter?  ( c -- ? )    ! lowercase letter
Letter?  ( c -- ? )    ! letter, either case
digit?   ( c -- ? )    ! decimal digit
digit>   ( c -- n )    ! the integer value of a digit char
blank?   ( c -- ? )    ! whitespace
```

```factor
USING: unicode ;

CHAR: A LETTER? .    ! => t
CHAR: a letter? .    ! => t
CHAR: 7 digit?  .    ! => t
CHAR: 7 digit>  .    ! => 7
```

## Case conversion

`ch>upper` and `ch>lower` flip a single character. The string-level
`>upper` and `>lower` apply them across every character of a string.

```factor
CHAR: a ch>upper .   ! => 65   (which is CHAR: A)
"Hello" >upper .     ! => "HELLO"
```

## Character literals

`CHAR: A` parses to the integer code point of `A`. For named
characters, use the names `space`, `tab`, `\n`, etc.:

```factor
CHAR: A .        ! => 65
CHAR: space .    ! => 32
CHAR: \n .       ! => 10
```

## Symbols

When a word needs to return a tag rather than a value — say,
`yes`/`no`/`maybe` instead of a boolean — declare each tag as a
*symbol*. A symbol is a word that pushes itself when called, and
two symbols compare equal only when they are the same name.

```factor
USING: kernel ;

SYMBOLS: yes no maybe ;

yes .    ! => yes
yes yes = .    ! => t
yes no = .     ! => f
```

`SYMBOL: name` declares one; `SYMBOLS: a b c ;` declares several.

[unicode]: https://docs.factorcode.org/content/vocab-unicode.html
