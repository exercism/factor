# Introduction

A *tuple* is Factor's record/struct/class type. Each tuple class has
a fixed set of named slots and Factor automatically generates getters
and setters for them.

## Defining a tuple

```factor
TUPLE: point
    { x initial: 0 }
    { y initial: 0 } ;
```

Each slot is declared `{ name initial: default-value }`. Without an
`initial:` clause the default is `f`.

## Constructing a tuple

The simplest constructor is `new`:

```factor
point new .
! => T{ point }
```

`boa` ("by order of arguments") fills slots in declaration order from
the data stack:

```factor
3 4 point boa .
! => T{ point { x 3 } { y 4 } }
```

The literal syntax `T{ class { slot value } … }` lets you construct a
tuple with a subset of slots set, and prints the same way:

```factor
T{ point { x 3 } } .
! => T{ point { x 3 } }
```

When a slot's value matches its default, the printer omits it.

## Reading a slot

Factor generates a getter `slot>>` for each slot. Getters live in
[`accessors`][accessors]:

```factor
T{ point { x 3 } { y 4 } } x>> .
! => 3
```

## Updating a slot

Setters are written `>>slot` and *mutate* the tuple in place:

```factor
T{ point { x 3 } { y 4 } } 10 >>x .
! => T{ point { x 10 } { y 4 } }
```

To leave the original alone, `clone` first:

```factor
: shifted ( pt -- pt' )
    clone 10 >>x ;
```

`change-slot` takes a quotation that maps the current value to the
new one:

```factor
: shift-x ( pt dx -- pt )
    [ + ] curry change-x ;
```

`change-x` is also mutating, so `clone` before calling it if you want
to preserve the original.

## `unless*`

`unless*` (in [`kernel`][kernel]) is the "default value" idiom: if
the top of the stack is truthy, leave it alone; otherwise drop it
and run the quotation:

```
unless* ( value/f quot -- value )
```

```factor
"hello" [ "default" ] unless* .   ! => "hello"
f       [ "default" ] unless* .   ! => "default"
```

[accessors]: https://docs.factorcode.org/content/vocab-accessors.html
[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
