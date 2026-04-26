# About

Factor characters are *integers* — Unicode code points — so plain
numeric `<`, `>`, `=` already give you case-sensitive ordering. The
[`unicode`][unicode] vocabulary adds Unicode-aware predicates and
single-character case conversion on top.

## Predicates

```
LETTER?  ( c -- ? )    ! uppercase letter
letter?  ( c -- ? )    ! lowercase letter
Letter?  ( c -- ? )    ! letter, either case
digit?   ( c -- ? )    ! decimal digit
blank?   ( c -- ? )    ! whitespace
alpha?   ( c -- ? )    ! letter or decimal digit
```

```factor
USING: unicode ;

CHAR: A LETTER? .    ! => t
CHAR: a letter? .    ! => t
CHAR: 7 digit?  .    ! => t
CHAR: \n blank? .    ! => t
```

## Case conversion

```
ch>upper  ( c -- c' )
ch>lower  ( c -- c' )
ch>title  ( c -- c' )
```

The string-level `>upper`, `>lower`, and `>title` apply these to
every character of a string.

```factor
CHAR: a ch>upper .   ! => 65   (which is CHAR: A)
"Hello" >upper .     ! => "HELLO"
```

[unicode]: https://docs.factorcode.org/content/vocab-unicode.html
