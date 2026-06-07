# About

A **word** is Factor's name for a function. You met the data stack and
the shuffle words in `basics`; here you define your own words that
compute with their inputs.

```factor
: square ( x -- x*x ) dup * ;
: hello  ( -- )       "Hello, world!" print ;
: max3   ( a b c -- max ) max max ;
```

A definition is `:`, a stack effect, the body, then `;`. The names
inside `( … -- … )` are for the reader; what the compiler checks is the
*number* of inputs and outputs. A mismatch is a compile-time error,
which catches a class of bugs that would be runtime errors in a
dynamically-typed language without this kind of declaration.

The integer arithmetic words `+`, `-`, `*` come from the `math`
vocabulary and each consume two numbers from the top of the stack. The
top of the stack is the right-hand operand, so `8 3 -` computes
`8 - 3`.

`CONSTANT:` defines a name for a fixed value; calling the name pushes
the value, exactly like any other word. Place constants at the top of
the file, before any word that uses them.

A word's body may call any word already in scope — earlier definitions
in the same file, words from imported vocabularies, and the constants
you declared. Composing small, single-purpose words is the normal way
to build up a program.

By convention:

- Words and constants use `lowercase-kebab-case`.
- Predicates end in `?` and produce a boolean (`even?`, `empty?`).
- Words that mutate their input often share a name with the
  non-mutating version, distinguished only by context.
