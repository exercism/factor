# Introduction

This exercise builds on the data stack and stack-effect notation you
met in [Leah's Luscious Lasagna][lasagna]. Here you will write words
that combine boolean values.

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

## Swapping the top two values

If two values are on the stack in the wrong order for the next word,
`swap ( x y -- y x )` flips the top two. You will need it for one of
the tasks below.

[lasagna]: https://exercism.org/tracks/factor/exercises/lasagna
