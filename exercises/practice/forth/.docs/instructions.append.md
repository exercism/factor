# Instructions append

## Words

- `evaluate ( instructions -- stack )` — run a sequence of Forth
  instruction strings and return the resulting stack as an
  array of integers.

Splitting the solution across two files is part of this exercise.
Put the primitive operations in a `forth.builtins` sub-vocabulary
and the parser/dispatcher in the main `forth` vocabulary:

```
forth/
├── forth.factor              ! IN: forth
└── builtins/
    └── builtins.factor       ! IN: forth.builtins
```

In `forth.builtins`, define a stack-transforming word per
primitive — each takes an array (the Forth stack) and returns a
new array:

- `forth+ ( s -- s' )`, `forth- ( s -- s' )`,
  `forth* ( s -- s' )`, `forth/ ( s -- s' )`
- `forth-dup ( s -- s' )`, `forth-drop ( s -- s' )`,
  `forth-swap ( s -- s' )`, `forth-over ( s -- s' )`

Throw error classes from `forth.builtins` for the canonical
runtime errors:

- `empty-stack`
- `only-one-value-on-the-stack`
- `divide-by-zero`

In the main `forth` vocabulary, throw:

- `undefined-operation` — when an instruction references a word
  that is neither a built-in nor user-defined.
- `illegal-operation` — when a definition tries to redefine an
  integer literal as a word.

Word names are case-insensitive. User definitions use the
familiar `: name body ;` syntax. When a definition references a
word that has its own definition at that moment, the new word
should capture the *current* meaning — later redefinitions of
that word do not change the captured one.
