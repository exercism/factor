# Introduction

Welcome to Factor! Factor is a *concatenative* language: instead of
calling functions with parenthesised arguments, you write a sequence of
**words** that pass values to each other through a shared **data
stack**. Picture a stack of cargo crates on a quay, newest on top.

## Comments

A `!` starts a line comment — Factor ignores everything from `!` to the
end of the line. The examples below use `!` to annotate what code does.

## The data stack

Writing a literal pushes it onto the top of the stack. Code is read
left to right.

```factor
1 2 3    ! stack (bottom → top): 1 2 3
```

There is no other way to pass data around — every word reads its inputs
from the top of the stack and writes its outputs back there. `.` pops
the top value and prints it; `.s` prints the *whole* stack without
consuming anything, which is handy for seeing what a snippet left
behind.

## Stack effects

Every word is documented with a **stack effect** of the form
`( inputs -- outputs )`. It is the word's contract: the word pops the
inputs off the top of the stack and leaves the outputs in their place.
The names inside are documentation for humans — the stack itself is
positional, not named. The top of the stack is the *right-hand* name.

## Defining a word

`:` starts a word definition, the stack effect comes next, then the
body, then `;` ends it. Factor's compiler checks that the body really
does leave what the stack effect declares.

```factor
: restow ( a b -- b a ) swap ;
```

## Shuffle words

These `kernel` words rearrange the top of the stack without doing any
arithmetic — they just move crates around:

```
dup  ( x   -- x x   )    ! copy the top crate
drop ( x   --       )    ! remove the top crate
swap ( x y -- y x   )    ! flip the top two
over ( x y -- x y x )    ! copy the second crate onto the top
nip  ( x y -- y     )    ! remove the second crate
rot  ( x y z -- y z x )  ! roll the third crate up to the top
```

Reach for `dup` when one crate must feed two words, `drop` to throw a
crate away, `swap` when the top two are in the wrong order, `over` or
`nip` to work with the crate underneath, and `rot` to bring a buried
crate to the top.

The wider family (`-rot`, `dupd`, `swapd`, `2dup`, …) follows the same
idea; you will meet those words later.

## Naming conventions

Words use `lowercase-kebab-case`: lowercase letters joined by hyphens.

[Tour: stack shuffling](https://docs.factorcode.org/content/article-tour-stack-shuffling.html)
