# Introduction

Some loops can't be written as "do this for each element of a
sequence" — you have to keep going until some condition flips.
Factor's `while` combinator is the tool for that: a predicate
quotation says "keep going?", a body quotation does one step's
work, and `while` repeats until the predicate gives `f`.

## `while` and `until`

```
while ( pred body -- )
until ( pred body -- )
```

`pred` and `body` are both quotations that operate on the data
stack. `while` keeps looping while `pred` leaves a truthy value;
`until` is the symmetric form (loop while `pred` leaves `f`).

A single piece of state can flow on the stack between the
predicate and the body:

```factor
USING: kernel math ;

5 [ dup 0 > ] [ dup . 1 - ] while drop
! prints 5 4 3 2 1
```

Trace: the predicate `dup 0 >` peeks at the running counter; the
body `dup . 1 -` prints it and decrements it; the loop stops once
the counter reaches `0`. The trailing `drop` discards that final
`0` from the stack.

## Multiple state values with locals

When the loop carries more than one value — a remaining list and
a running total, say — stack juggling gets noisy. The cleanest
pattern is to declare *locals* with `::`:

```
:: word ( inputs -- outputs ) ... ;
```

Inside the body, `:> name!` adds a mutable local; reads use
`name`, writes use `name!` (which consumes the new value off the
stack and assigns it).

```factor
USING: kernel locals math sequences ;

! Walk a sequence from the front, summing as we go
:: sum-by-hand ( seq -- total )
    seq :> rest!
    0   :> running!
    [ rest length 0 > ] [
        rest unclip [ rest! ] dip
        running + running!
    ] while
    running ;
```

Two locals here (`rest` and `running`) cover the whole loop's
state: the predicate inspects them, the body updates them, and
the final value is returned at the end.

`unclip ( seq -- rest first )` peels off the first element of a
sequence — handy when the loop wants to consume a list one
element per iteration. The `[ rest! ] dip` form updates `rest`
to the remaining tail while leaving the freshly-popped element
on the stack for the body to use.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[locals]: https://docs.factorcode.org/content/article-locals.html
