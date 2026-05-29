# About

Factor concentrates randomness in the [`random`][random] vocabulary
around a single generic word:

```
random ( obj -- elt )
```

It dispatches on its argument:

- an **integer** `n` yields a random integer in `[0, n)`;
- a **sequence** yields a random element;
- assocs, hash-sets, and `uniform-distribution` tuples are also
  supported.

Two sequence helpers build on it:

```factor
USING: random ;

{ 1 2 3 4 5 } randomize .   ! shuffle in place (Fisher–Yates)
{ 1 2 3 4 5 } 3 sample .    ! 3 distinct elements; error if too many
```

`randomize` mutates and returns the sequence, so `clone` first if you
need to keep the original order.

## Where the randomness comes from

`random` reads the generator held in the `random-generator` dynamic
variable. By default that's a Mersenne Twister seeded from the system
clock, so every process differs. You can install a different generator
for the duration of a quotation:

```
<mersenne-twister> ( seed -- rnd )
with-random        ( rnd quot -- )
```

```factor
USING: random random.mersenne-twister ;

42 <mersenne-twister> [ { 1 2 3 } randomize ] with-random .
! => the same ordering on every run
```

Because `with-random` simply binds `random-generator` for the dynamic
extent of the quotation, a word that wraps it should be marked
`inline` so the quotation can leave its result on the stack for the
caller.

Beyond these, `random` offers `random-bits`, `random-unit`,
`uniform-random`, and `normal-random` for other distributions, plus
`system-random-generator` and `secure-random-generator` for
non-reproducible and cryptographic needs.

[random]: https://docs.factorcode.org/content/vocab-random.html
