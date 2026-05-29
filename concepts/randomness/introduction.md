# Introduction

Factor's [`random`][random] vocabulary provides one generic word,
`random`, that adapts to its argument, plus helpers for shuffling and
sampling sequences.

```factor
USING: random ;

6 random .                       ! a value from 0..5
{ "rock" "paper" "scissors" } random .   ! a random element
{ 1 2 3 4 5 } randomize .        ! the same cards, reordered
{ 1 2 3 4 5 } 2 sample .         ! two distinct elements
```

`random` of an integer `n` returns a value in `[0, n)`; of a sequence
it returns a random element. `randomize` shuffles in place, and
`sample` draws distinct elements.

By default these draw from a global generator seeded from the system
clock. To make outcomes reproducible, install a seeded generator with
`<mersenne-twister>` (from [`random.mersenne-twister`][mt]) and
`with-random`:

```factor
USING: random random.mersenne-twister ;

42 <mersenne-twister> [ 6 random ] with-random .   ! same value every run
```

[random]: https://docs.factorcode.org/content/vocab-random.html
[mt]: https://docs.factorcode.org/content/vocab-random.mersenne-twister.html
