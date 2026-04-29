# Introduction

Welcome to Factor! Factor is a *concatenative* language: instead of
calling functions with parenthesised arguments, you write a sequence of
words that pass values to each other through a shared **data stack**.

## Comments

A `!` starts a line comment — Factor ignores everything from `!` to the
end of the line. The examples below use `!` both to annotate what code
does and to show what it would print.

## The data stack

Writing a literal pushes it onto the top of the stack. Code is read
left to right.

```factor
2 3    ! stack (bottom → top): 2 3
```

There is no other way to pass data around — every word reads its
inputs from the top of the stack and writes its outputs back there.

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

The arithmetic words live in the `math` vocabulary, so a file that uses
them needs `math` in its `USING:` line.

## Stack effects

Every word is documented with a **stack effect** of the form
`( inputs -- outputs )`. It is the word's contract: this word pops the
inputs off the top of the stack and leaves the outputs in their place.
The names inside are documentation for humans — the stack itself is
positional, not named.

```factor
! + is specified as ( x y -- sum )
! . is specified as ( x   --     )
```

The top of the stack is the *right-hand* input. So `8 3 -` has `3` on
top, the stack effect is `( x y -- difference )`, and the result is
`8 - 3`.

A trailing `?` in the outputs is the convention for "a boolean", but
the lasagna exercise uses only numbers.

## Rearranging the top of the stack

Three small shuffle words from the `kernel` vocabulary handle the
most common rearrangements:

```
dup  ( x   -- x x   )    ! duplicate the top
swap ( x y -- y x   )    ! flip the top two
over ( x y -- x y x )    ! copy the second-from-top onto the top
```

Use `dup` when one input value needs to feed two operations,
`swap` when two values are in the wrong order for the next word,
and `over` when you need to *keep* a value while still using it.

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
