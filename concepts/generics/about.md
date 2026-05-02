# About

A `GENERIC:` declaration introduces a word whose behaviour
depends on the class of one of its arguments. Concrete behaviour
is provided by *methods* (`M:`) that target specific classes.

```factor
GENERIC: stringify ( obj -- str )
M: integer stringify number>string ;
M: string  stringify ;
M: f       stringify drop "(none)" ;
```

When `stringify` is called, Factor inspects the top of the stack,
looks up the most-specific method whose class matches, and runs
it. If no method matches, an error is thrown.

## Dispatch class

By default, dispatch happens on the topmost argument (the first
input declared in the stack effect). For multi-argument
dispatch, see `HOOK:` and `MATH:`, which dispatch on the second
argument or on numeric promotion respectively.

## Adding methods to a generic

You can extend a generic any time, even from a different
vocabulary, as long as you can `USE:` both the generic and the
class:

```factor
USING: math ;
M: ratio  area drop 0 ;     ! adds an `area` method for ratios
```

## Methods on built-in classes

Generics work just as well on built-in classes (`integer`,
`string`, `array`, `f`, `t`) as on user-defined tuples. Methods
on `f` and `t` are particularly useful for "is-set?"-style
predicates that have natural defaults.

## When a generic is the right choice

Reach for `GENERIC:` when:

- A single operation has *genuinely different* implementations
  for different inputs (not just a `case` over labels).
- You expect new types to be added later by other code.
- You want the type system to enforce that the operation is
  defined for every relevant class — Factor can list the missing
  methods for you.

If the variation is a small, fixed enumeration of labels, a
`case` is simpler.
