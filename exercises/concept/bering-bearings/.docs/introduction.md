# Introduction

A `GENERIC:` declaration creates a word whose behaviour depends
on the *class* of one of its arguments. Concrete behaviour comes
from *methods*, defined with `M:`.

```factor
GENERIC: area ( shape -- n )

TUPLE: square side ;
TUPLE: circle radius ;

M: square area
    side>> dup * ;
M: circle area
    radius>> dup * pi * ;
```

When `area` is called, Factor inspects the top of the stack,
looks up the most-specific method whose class matches, and runs
it. With locals you can use `M::`:

```factor
TUPLE: rectangle width height ;

M:: rectangle area ( r -- n )
    r width>> r height>> * ;

T{ rectangle { width 3 } { height 4 } } area .   ! => 12
```

Generics let you add new representations later without changing
the calling code: `area` already worked for `square` and `circle`,
and the `rectangle` method is picked up automatically wherever
`area` is called.

## When a generic is the right choice

Reach for `GENERIC:` when:

- A single operation has *genuinely different* implementations
  for different inputs.
- You expect new types to be added by future code.
- You want the type system to enforce per-class definitions.

If the variation is just a small enumeration of labels, a
`case` is simpler.

## Joining a mixin with `INSTANCE:`

A *mixin* is a generic class that's *open* — anyone can register
a new class as a member. Many of Factor's built-in protocols
(sequences, sets, streams, …) are exposed as mixins, so a custom
tuple can opt into the protocol's default methods by declaring
itself an instance:

```factor
MIXIN: shape
M: shape area                   ! a default area for any shape
    drop 0 ;

TUPLE: my-shape ;
INSTANCE: my-shape shape         ! my-shape is now a `shape`

T{ my-shape } area .   ! => 0
```

After `INSTANCE:`, every default method `M: shape …` automatically
dispatches on `my-shape`, and any code that asks for a `shape`
accepts a `my-shape`. `M:` is for adding methods to a generic;
`INSTANCE:` is for joining a class to a mixin.

## `TYPED::` — checked inputs for a plain word

`GENERIC:`/`M:` choose a method by the class of an argument.
Sometimes you don't want dispatch — just *one* word that insists
its inputs are of a given class. `TYPED::` (in the `typed`
vocabulary) is `::` with a class written after each input name:

```factor
TYPED:: triple ( n: integer -- m )
    n 3 * ;

14 triple .   ! => 42
```

`n: integer` reads like the locals you already use, with the
class spelled after the colon. There's no dispatch — one
definition, one behaviour — but each argument is now checked
against its class: a mismatch like `"x" triple` is rejected
(*expected input value of type integer but got string*) rather
than silently flowing through.

## Math functions and constants

This exercise also leans on a few words from `math.constants`
and `math.functions` that you'll meet for the first time here:

- `pi` — the constant π, from `math.constants`.
- `sin ( x -- y )`, `cos ( x -- y )` — sine and cosine of an
  angle in radians.
- `e^ ( x -- y )` — `e` raised to the power of `x`. (For an
  arbitrary base, use `^`.)

```factor
pi 2 / sin   ! → 1.0
0 cos        ! → 1.0
1 e^         ! → 2.718281828459045
```
