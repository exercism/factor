# Introduction

When the number of iterations of a loop isn't known in advance —
"keep going until some predicate stops being true" — Factor uses
the `while` combinator from [`kernel`][kernel]:

```
while ( pred body -- )
```

Both `pred` and `body` are quotations that operate on the data
stack. `while` calls `pred`; if it leaves a truthy value on top,
`while` runs `body` and repeats; otherwise it stops. The state
that flows from one iteration to the next lives on the stack
between calls (or in named locals when there's more than one
piece of state).

```factor
USING: kernel math ;

5 [ dup 0 > ] [ dup . 1 - ] while drop
! prints 5 4 3 2 1
```

`until` is the symmetric form: it keeps going *until* the
predicate becomes truthy.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
