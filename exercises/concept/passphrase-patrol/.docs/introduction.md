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
\s        ! any space, tab, or newline
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
capital letters. Putting it together, `R/ [A-Z]{2}-\d{4}/` describes
"two capitals, a dash, then four digits" — text like `NS-1024`.

## Matching a whole string

`matches?` answers "does this *entire* string fit the pattern?" — the
pattern has to account for every character, start to end:

```
matches? ( string regexp -- ? )
```

```factor
USING: regexp ;

"NS-1024" R/ [A-Z]{2}-\d{4}/ matches? .   ! => t
"NS-10"   R/ [A-Z]{2}-\d{4}/ matches? .   ! => f   (too few digits)
"ns-1024" R/ [A-Z]{2}-\d{4}/ matches? .   ! => f   (lowercase letters)
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

"seen NS-1024 then AB-0007" R/ [A-Z]{2}-\d{4}/ all-matching-subseqs .
! => { "NS-1024" "AB-0007" }

"NS-1024" R/ \d/ count-matches .   ! => 4   (four digits)
```

## Replacing matches

`re-replace` swaps every match for a piece of replacement text and
returns the new string:

```
re-replace ( string regexp replacement -- result )
```

```factor
USING: regexp ;

"user=alice pass=hunter2 ok" R/ pass=\S+/ "pass=****" re-replace .
! => "user=alice pass=**** ok"
```

(`\S` means "any non-space character", so `pass=\S+` matches `pass=`
followed by the rest of that word.)

Other handy `regexp` words you'll meet later include `re-contains?`
(is there *any* match?), `first-match` (the first match only), and
`re-split` (split a string wherever the pattern matches).

[regexp]: https://docs.factorcode.org/content/vocab-regexp.html
