# Introduction

## Booleans in Factor

True and false are written as the words `t` and `f`. `f` is Factor's only
falsy value — everything else, including `0` and empty collections, is
truthy.

```factor
t .
! => t

f .
! => f
```

## Boolean operators

Three words in the `kernel` vocabulary handle the common cases:

- `and` — returns truthy when both inputs are truthy.
- `or`  — returns truthy when either input is truthy.
- `not` — inverts its argument.

```factor
t t and .    ! => t
t f and .    ! => f

f t or .     ! => t

t not .      ! => f
```

Because Factor is concatenative, these words consume their arguments from
the data stack. If your arguments are on the stack in the "wrong" order for
a particular operator, use `swap` to flip them.
