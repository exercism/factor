# Introduction

A *regular expression* (regex) is a small pattern that describes what
some text should look like. Factor's regex tools live in the
[`regexp`][regexp] vocabulary, and a pattern is written between `R/ `
and `/`.

Most characters in a pattern mean themselves. A few special pieces
stand for *kinds* of character or *how many* to expect:

```
\d        ! any digit 0–9
\s        ! any whitespace; \S means any non-whitespace
[A-Z]     ! any one capital letter
.         ! any single character

{4}       ! exactly 4 times       +   ! one or more
{2,5}     ! 2 to 5 times          *   ! zero or more
?         ! optional (0 or 1)
```

So `R/ [A-Z]{2}-\d{4}/` means "two capitals, a dash, four digits".

`matches?` tests whether a *whole* string fits the pattern:

```
matches? ( string regexp -- ? )
```

```factor
USING: regexp ;

"NS-1024" R/ [A-Z]{2}-\d{4}/ matches? .   ! => t
"NS-10"   R/ [A-Z]{2}-\d{4}/ matches? .   ! => f
```

Other words look *inside* a string: `all-matching-subseqs` returns
every match, `count-matches` counts them, `re-contains?` reports
whether there is any match, and `re-replace` swaps each match for new
text:

```
all-matching-subseqs ( string regexp -- seq )
count-matches        ( string regexp -- n )
re-contains?         ( string regexp -- ? )
re-replace           ( string regexp replacement -- result )
```

```factor
USING: regexp ;

"seen NS-1024 then AB-0007" R/ [A-Z]{2}-\d{4}/ all-matching-subseqs .
! => { "NS-1024" "AB-0007" }

"user=alice pass=hunter2" R/ pass=\S+/ "pass=****" re-replace .
! => "user=alice pass=****"
```

[regexp]: https://docs.factorcode.org/content/vocab-regexp.html
