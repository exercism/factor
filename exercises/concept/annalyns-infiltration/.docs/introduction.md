# Introduction

This exercise builds on the data stack and stack-effect notation you
met in [Leah's Luscious Lasagna][lasagna]. Here you will write words
that combine boolean values.

## Shuffle words

The most common shuffle words live in [`kernel`][kernel]:

```
dup    ( x -- x x )
dupd   ( x y -- x x y )
drop   ( x -- )
swap   ( x y -- y x )
swapd  ( x y z -- y x z )
over   ( x y -- x y x )
pick   ( x y z -- x y z x )
rot    ( x y z -- y z x )
-rot   ( x y z -- z x y )
rotd   ( w x y z -- w y z x )
spin   ( x y z -- z y x )
nip    ( x y -- y )

2dup   ( x y -- x y x y )
2drop  ( x y -- )
2nip   ( x y z -- z )
2swap  ( x y z w -- z w x y )
```

## Booleans

The two boolean literals are `t` and `f`. `f` is Factor's only falsy
value — everything else, including `0` and empty collections, is
truthy.

```factor
t .    ! => t
f .    ! => f
```

## Boolean words

Three boolean words live in the `kernel` vocabulary and are available
without a `USING:` line:

```
and ( x y -- ? )    ! true when both inputs are truthy
or  ( x y -- ? )    ! true when either input is truthy
not ( x   -- ? )    ! inverts its argument
```

```factor
t t and .    ! => t
t f and .    ! => f
f t or .     ! => t
t not .      ! => f
```

The `?` in each output is the stack-effect convention for "a boolean".

You'll need `swap` for one of the tasks below.

[lasagna]: https://exercism.org/tracks/factor/exercises/lasagna
[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
