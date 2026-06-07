# Introduction

A **word** is Factor's name for a function. Building on the data stack
from `basics`, this concept is about defining your own words: doing
arithmetic, naming fixed values, and composing words out of other
words.

A definition starts with `:`, gives a stack effect, then the body, then
`;`. The compiler checks that the body matches the declared effect:

```factor
: square ( x -- x*x ) dup * ;

4 square .    ! => 16
```

The integer arithmetic words `+`, `-`, `*` each pop two numbers and
push the result. They live in the `math` vocabulary, so a file that
uses them needs `math` on its `USING:` line. The top of the stack is
the right-hand operand:

```factor
2 3 + .    ! => 5
8 3 - .    ! => 5    (8 - 3, not 3 - 8)
2 3 * .    ! => 6
```

`CONSTANT:` names a fixed value. A constant is itself a word — calling
it pushes the value:

```factor
CONSTANT: pi 3

pi pi * .    ! => 9
```

A word's body can call any word already in scope, including ones you
defined earlier in the same file:

```factor
: double    ( x -- 2x ) 2 * ;
: quadruple ( x -- 4x ) double double ;

5 quadruple .    ! => 20
```

A trailing `?` in the outputs is the convention for "a boolean", and
words and constants both use `lowercase-kebab-case`.
