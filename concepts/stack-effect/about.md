# About

Factor's only data-passing convention is the *data stack*: words pop
their inputs and push their outputs. Every word definition is
required to declare a *stack effect* documenting that contract.

```factor
: square ( x -- x*x ) dup * ;
: hello  ( -- )       "Hello, world!" print ;
: max3   ( a b c -- max ) max max ;
```

The names inside `( … -- … )` are for the reader's benefit; what the
compiler checks is the *number* of inputs and outputs. A mismatch is
a compile-time error, which catches a class of bugs that would be
runtime errors in a dynamically-typed language without this kind of
declaration.

The handful of `kernel` shuffle words that come up in the very first
exercises:

```
dup  ( x   -- x x   )
swap ( x y -- y x   )
over ( x y -- x y x )
```

The full `kernel` shuffle family (`pick`, `rot`, `-rot`, `nip`,
`tuck`, etc.) and the larger `2`-prefixed cousins are covered in
`booleans` and `combinators`.

By convention:

- Predicates end in `?` and produce a boolean (`even?`, `empty?`).
- Setters are written `>>name`; getters `name>>`.
- Words that mutate their input often share a name with the
  non-mutating version, distinguished only by context.
