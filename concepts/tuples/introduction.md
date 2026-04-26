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
```

Each slot's getter is `slot>>` and setter is `>>slot` — the setter
*mutates*, so `clone` first if you need a non-destructive update:

```factor
T{ point { x 3 } { y 4 } } clone 10 >>x .
! => T{ point { x 10 } { y 4 } }
```

Slot defaults use `{ name initial: value }`; without `initial:`
the default is `f`.
