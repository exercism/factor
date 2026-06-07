# Introduction

Factor is a *concatenative* language: every word reads its inputs from
a shared **data stack** and pushes its outputs back onto it. There is
no other way to pass values around.

Writing a literal pushes it onto the top of the stack; code is read
left to right:

```factor
1 2 3    ! stack (bottom → top): 1 2 3
```

A *stack effect* declaration documents a word's contract:

```factor
: restow ( a b -- b a ) swap ;
```

`( a b -- b a )` says the word pops two values and leaves two behind in
the other order. The names are documentation — only the *number* of
inputs and outputs is checked by the compiler — and the top of the
stack is the right-hand name.

The everyday `kernel` **shuffle words** rearrange the top of the stack:

```
dup  ( x   -- x x   )
drop ( x   --       )
swap ( x y -- y x   )
over ( x y -- x y x )
nip  ( x y -- y     )
rot  ( x y z -- y z x )
```

Words are defined with `:` and end in `;`; the compiler refuses a
definition whose body doesn't match the declared effect.
