# Introduction

In [Cargo Shuffle][cargo-shuffle] you met Factor's **data stack** and
the shuffle words that rearrange it. This exercise builds on that: you
will define words that *compute* with their inputs rather than just
moving them around.

## Comments

A `!` starts a line comment — Factor ignores everything from `!` to the
end of the line. The examples below use `!` both to annotate what code
does and to show what it would print.

## Words

A **word** is Factor's name for a function. Calling a word pops some
values from the top of the stack and pushes some values back.
`.` pops the top value and prints it; the integer arithmetic words
`+`, `-`, `*` pop two numbers and push the result:

```factor
2 3 + .    ! prints 5
8 3 - .    ! prints 5    (8 - 3, not 3 - 8)
2 3 * .    ! prints 6
```

A related word, `.s`, prints the *whole* data stack without consuming
anything — handy in the listener (Factor's interactive prompt, where
you type code and see results) for seeing what a snippet leaves
behind. It's why later examples sometimes end in `.s` rather than `.`:
they leave more than one value on the stack, and `.s` shows them all.

The arithmetic words live in the `math` vocabulary, so a file that uses
them needs `math` in its `USING:` line.

## Stack effects

Every word is documented with a **stack effect** of the form
`( inputs -- outputs )`. It is the word's contract: this word pops the
inputs off the top of the stack and leaves the outputs in their place.
The names inside are just there to help you read it. Factor doesn't
use them — it only tracks the *order* values sit in on the stack.

```factor
! + is specified as ( x y -- sum )
! . is specified as ( x   --     )
```

The top of the stack is the *right-hand* input. So `8 3 -` has `3` on
top, the stack effect is `( x y -- difference )`, and the result is
`8 - 3`.

A trailing `?` in the outputs is the convention for "a boolean", but
the lasagna exercise uses only numbers.

One shuffle word from Cargo Shuffle comes up below: `swap`
`( x y -- y x )`, which flips the top two values when they are in the
wrong order for the next word.

## Defining a word

`:` starts a word definition, the stack effect comes next, then the
body, then `;` ends it.

```factor
: square ( x -- x^2 ) dup * ;

4 square .    ! => 16
```

Factor's compiler checks that the body actually matches the declared
stack effect: a word that claims `( x -- y )` but leaves zero or two
values on the stack will not compile.

## Constants

`CONSTANT:` defines a name for a fixed value. A constant is itself a
word — calling it pushes the value onto the stack:

```factor
CONSTANT: pi 3

pi pi * .    ! => 9
```

`CONSTANT:` is core syntax and does not need a `USING:` line. Place
constants at the top of the file, before any word that uses them.

## Calling one word from another

A word's body can call any word already in scope, including ones you
defined earlier in the same file:

```factor
: double    ( x -- 2x ) 2 * ;
: quadruple ( x -- 4x ) double double ;

5 quadruple .    ! => 20
```

This is how the last task in the exercise reuses an earlier one.

## Naming conventions

Words and constants both use `lowercase-kebab-case`: lowercase letters
joined by hyphens (for example, `expected-bake-time`,
`preparation-time`).

[cargo-shuffle]: https://exercism.org/tracks/factor/exercises/cargo-shuffle
