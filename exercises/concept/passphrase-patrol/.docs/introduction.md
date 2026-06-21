# Introduction

A *regular expression* (regex) is a small pattern that describes what
some text should look like. Instead of checking a string character by
character yourself, you write the shape you want once and let Factor do
the matching. Factor's regex tools live in the [`regexp`][regexp]
vocabulary.

## Writing a pattern

In Factor you write a regex between `R/ ` and `/`:

```factor
R/ cat/      ! the pattern that matches the letters c, a, t
```

Most characters in a pattern just mean themselves — `R/ cat/` matches
the text `cat`. The power comes from a few special pieces that stand
for *kinds* of characters or *how many* of them.

### Character classes — "one character from a set"

```
\d        ! any digit, 0–9
\D        ! any NON-digit (the opposite of \d)
\s        ! any space, tab, or newline
\S        ! any NON-space character (the opposite of \s)
[A-Z]     ! any one capital letter A to Z
[a-z]     ! any one lowercase letter
[0-9]     ! any one digit (same as \d)
.         ! any single character at all
```

A class matches exactly *one* character. `[A-Z]` matches `Q` but not
`QQ`.

### Quantifiers — "how many"

Put one of these *after* a piece to say how many times it may repeat:

```
{4}       ! exactly 4 times
{2,5}     ! between 2 and 5 times
+         ! one or more
*         ! zero or more
?         ! zero or one (optional)
```

So `\d{4}` means four digits in a row, and `[A-Z]+` means one or more
capital letters. Putting it together, `R/ [A-Z]+-\d+/` describes "one
or more capitals, a dash, then one or more digits" — text like
`SALE-2024`. The `-` here is an ordinary character: outside of `[ ]` a
dash just matches a dash (inside a class, as in `[A-Z]`, it marks a
range).

## Matching a whole string

`matches?` answers "does this *entire* string fit the pattern?" — the
pattern has to account for every character, start to end:

```
matches? ( string regexp -- ? )
```

```factor
USING: regexp ;

"SALE-2024"     R/ [A-Z]+-\d+/ matches? .   ! => t
"GET SALE-2024" R/ [A-Z]+-\d+/ matches? .   ! => f   (extra text before)
"SALE-2024 NOW" R/ [A-Z]+-\d+/ matches? .   ! => f   (extra text after)
"sale-2024"     R/ [A-Z]+-\d+/ matches? .   ! => f   (lowercase letters)
```

Even though `SALE-2024` sits inside `"GET SALE-2024"`, `matches?` still
says `f`: the extra characters are part of the string and they don't
fit the pattern. When you only care whether the pattern appears
*somewhere*, reach for `re-contains?` — it returns `t` exactly where
`matches?` returned `f`:

```
re-contains? ( string regexp -- ? )
```

```factor
USING: regexp ;

"GET SALE-2024" R/ [A-Z]+-\d+/ matches? .      ! => f
"GET SALE-2024" R/ [A-Z]+-\d+/ re-contains? .  ! => t
```

## Finding matches inside longer text

The next words look *inside* a string rather than requiring the whole
thing to fit.

`all-matching-subseqs` returns every place the pattern matches, as a
sequence of strings. `count-matches` just counts them:

```
all-matching-subseqs ( string regexp -- seq )
count-matches        ( string regexp -- n )
```

```factor
USING: regexp ;

"3 cats, 12 dogs, 1 fish" R/ \d+/ all-matching-subseqs .
! => { "3" "12" "1" }            (every run of digits)

"the quick fox" R/ \S+/ all-matching-subseqs .
! => { "the" "quick" "fox" }     (every run of non-space characters)

"a1b2c3" R/ \d/ count-matches .   ! => 3   (three digits)
```

## Replacing matches

`re-replace` swaps every match for a piece of replacement text and
returns the new string:

```
re-replace ( string regexp replacement -- result )
```

```factor
USING: regexp ;

"page 7 of 12" R/ \d+/ "N" re-replace .
! => "page N of N"
```

The `regexp` vocabulary has more words worth knowing — follow the
links for details: [`first-match`][first-match] (the first match only)
and [`re-split`][re-split] (split a string wherever the pattern
matches).

[regexp]: https://docs.factorcode.org/content/vocab-regexp.html
[first-match]: https://docs.factorcode.org/content/word-first-match%2Cregexp.html
[re-split]: https://docs.factorcode.org/content/word-re-split%2Cregexp.html
