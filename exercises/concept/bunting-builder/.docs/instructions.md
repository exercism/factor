# Instructions

Brooke is sewing bunting for the school's spring fair. Each line
of bunting is a horizontal row of `n` little flags, and every
flag's character is decided by where the flag sits in the row,
counted from the left starting at `0`. Help her assemble the
patterns below.

## 1. Alphabet bunting

Define `alphabet-bunting` to take a non-negative integer `n` off
the stack and return a string of the first `n` lowercase letters
of the alphabet.

```factor
5 alphabet-bunting .
! => "abcde"

0 alphabet-bunting .
! => ""
```

You can assume `n` is at most `26`.

## 2. Counting bunting

Define `counting-bunting` to take `n` and return a string of `n`
digits where the flag at position `i` shows `i mod 10`.

```factor
12 counting-bunting .
! => "012345678901"
```

## 3. Stripe bunting

Define `stripe-bunting` to alternate between two characters: even
positions get `*` and odd positions get `-`.

```factor
6 stripe-bunting .
! => "*-*-*-"

1 stripe-bunting .
! => "*"
```

## 4. Marker bunting

Every fifth flag is a special marker. Define `marker-bunting` so
that positions `0`, `5`, `10`, … get `|` and the rest get `.`.

```factor
11 marker-bunting .
! => "|....|....|"
```

## 5. Valley bunting

Brooke is hanging a fixed-size 10-flag bunting that anchors on a
hook at the centre. Counting from the leftmost flag at position
`-5` up to (but not including) `5`, each flag's character is the
distance from the centre, written as a digit.

Define `valley-bunting` (taking no inputs) to return that fixed
string.

```factor
valley-bunting .
! => "5432101234"
```
