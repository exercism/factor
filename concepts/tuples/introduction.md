# Introduction

A *tuple* is Factor's record/struct/class type. Each tuple class
has a fixed set of named slots, and Factor auto-generates getters
and setters for them.

```factor
TUPLE: point
    { x initial: 0 }
    { y initial: 0 } ;

T{ point { x 3 } { y 4 } } x>> .   ! => 3
3 4 point boa .                    ! => T{ point { x 3 } { y 4 } }
point new .                        ! => T{ point { x 0 } { y 0 } }
```

`boa` ("by order of arguments") fills slots from the stack, in
declaration order. `new` builds an instance with each slot at its
declared `initial:` value (or `f` if none).

Each slot's getter is `slot>>` and setter is `>>slot` — the setter
*mutates*, so `clone` first if you need a non-destructive update:

```factor
T{ point { x 3 } { y 4 } } clone 10 >>x .
! => T{ point { x 10 } { y 4 } }
```

Slot defaults use `{ name initial: value }`; without `initial:`
the default is `f`.
