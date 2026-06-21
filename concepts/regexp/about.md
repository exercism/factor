# About

A *regular expression* (regex) is a small pattern that describes the
shape of some text. Factor's regex tools live in the [`regexp`][regexp]
vocabulary, and a pattern is written as a literal between `R/ ` and
`/`.

Most characters in a pattern match themselves. The expressive power
comes from character classes and quantifiers:

```
\d        ! a digit 0–9            \s   ! whitespace
\w        ! a "word" character     \S   ! non-whitespace
[A-Z]     ! one capital letter     .    ! any one character
[^0-9]    ! any char except a digit

{4}       ! exactly 4              +    ! one or more
{2,5}     ! between 2 and 5        *    ! zero or more
?         ! optional               |    ! either side (alternation)
```

So `R/ [A-Z]{2}-\d{4}/` matches "two capitals, a dash, four digits".

## Whole-string matching vs. searching

`matches?` succeeds only when the *entire* string fits the pattern.
The other words search *within* a string:

```
matches?             ( string regexp -- ? )
re-contains?         ( string regexp -- ? )
count-matches        ( string regexp -- n )
all-matching-subseqs ( string regexp -- seq )
first-match          ( string regexp -- slice/f )
re-split             ( string regexp -- seq )
re-replace           ( string regexp replacement -- result )
```

```factor
USING: regexp ;

"NS-1024" R/ [A-Z]{2}-\d{4}/ matches? .         ! => t
"id NS-1024 ok" R/ [A-Z]{2}-\d{4}/ matches? .   ! => f   (extra text)
"id NS-1024 ok" R/ [A-Z]{2}-\d{4}/ re-contains? .   ! => t

"a1b2c3" R/ \d/ count-matches .   ! => 3
"a1b2c3" R/ \d/ re-replace .      ! NOTE: see re-replace below
```

## Slices

`first-match` and `re-split` return `slice` objects — lightweight
views into the original string rather than fresh strings. Coerce a
slice with `>string` when you need a standalone string (for example to
compare against a string literal). `all-matching-subseqs` already
returns strings.

## Replacing

`re-replace` substitutes every match with a replacement string and
returns the result:

```factor
USING: regexp ;

"user=alice pass=hunter2" R/ pass=\S+/ "pass=****" re-replace .
! => "user=alice pass=****"
```

## Building a pattern at runtime

`R/ /` is parsed when the file loads. To build a pattern from a string
computed at runtime, use `<regexp>`:

```
<regexp> ( string -- regexp )
```

[regexp]: https://docs.factorcode.org/content/vocab-regexp.html
