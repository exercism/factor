# Introduction

Games of chance need a source of randomness. Factor's [`random`][random]
vocabulary provides one generic word, `random`, that adapts to whatever
you hand it, plus helpers for shuffling and sampling, and a way to make
randomness *reproducible* for tests.

## Marking a word `inline`

Some of this exercise's tasks define a word that takes a *quotation* (a
`[ … ]` block) as an argument and runs it. Factor has one firm rule
about that: **a word that `call`s a quotation it received as an argument
must be declared `inline`**, written by putting `inline` right after the
closing `;`.

`inline` tells the compiler to splice the word's body into each call
site instead of compiling it once on its own.

- The caller's quotation is stitched in directly, so **whatever the
  quotation leaves on the stack flows back to the caller** — even though
  the word's own stack effect declares no outputs.

Here is a small word that pushes `10` and then runs the quotation it was
handed:

```factor
USING: kernel math prettyprint ;

: with-ten ( quot -- ) 10 swap call ; inline
```

Its stack effect, `( quot -- )`, names no outputs — yet calling it with
two quotations of *different* effects produces different results, all
flowing back to the caller:

```factor
[ 1 + ] with-ten .        ! => 11   (quotation ( n -- n ): one value back)
[ dup 2 * ] with-ten . .  ! => 20
                          ! => 10   (quotation ( n -- n n ): two values back)
```

## `random` — one element

`random` (in [`random`][random]) is generic over its argument:

```
random ( obj -- elt )
```

- Given an **integer** `n`, it returns a random integer in `[0, n)`:

```factor
USING: random ;

6 random .    ! 4   (a value from 0 to 5)
```

- Given a **sequence**, it returns a random element:

```factor
{ "rock" "paper" "scissors" } random .    ! "paper"
```

To roll a normal die you shift the range up by one: `random` of `6`
gives 0 to 5, so `6 random 1 +` gives 1 to 6.

## Drawing several values

To collect a fixed number of random draws, repeat a quotation with
`replicate` (in [`sequences`][sequences]):

```
replicate ( n quot -- seq )
```

```factor
USING: random sequences ;

3 [ 6 random 1 + ] replicate .    ! { 4 1 6 }   (three dice)
```

## `randomize` — shuffle in place

`randomize` (in [`random`][random]) returns the sequence with its
elements in a random order:

```
randomize ( seq -- randomized )
```

```factor
{ 1 2 3 4 5 } randomize .    ! { 3 1 5 2 4 }
```

It shuffles **in place** and returns the same sequence, so `clone`
first if you need to keep the original order.

## `sample` — several distinct elements

`sample` (in [`random`][random]) draws `n` *distinct* elements from a
sequence — like dealing a hand of cards, never the same card twice:

```
sample ( seq n -- seq' )
```

```factor
{ 10 20 30 40 50 } 3 sample .    ! { 40 10 30 }
```

Asking for more elements than the sequence holds is an error.

## Reproducible randomness

By default `random` draws from a global generator seeded from the
system clock, so every run differs. For tests — or any time you want a
game you can *replay* — bind a generator with a fixed **seed**.

`<mersenne-twister>` (in [`random.mersenne-twister`][mt]) builds a
generator from an integer seed, and `with-random` (in [`random`][random])
runs a quotation with that generator installed:

```
<mersenne-twister> ( seed -- rnd )
with-random        ( rnd quot -- )
```

```factor
USING: random random.mersenne-twister ;

42 <mersenne-twister> [ 6 random 1 + ] with-random .
! always the same value for seed 42
```

Everything inside the quotation — `random`, `randomize`, `sample` —
draws from the seeded generator, so the same seed always reproduces the
same outcome.

A word that takes a quotation as an argument and runs it through
`with-random` falls under the rule from [Marking a word
`inline`](#marking-a-word-inline): `with-random` ends up `call`ing that
quotation, so such a wrapper must be marked `inline`.

[random]: https://docs.factorcode.org/content/vocab-random.html
[mt]: https://docs.factorcode.org/content/vocab-random.mersenne-twister.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
