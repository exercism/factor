# Introduction

A `:` definition can call itself directly. Factor's compiler infers
the stack effect of recursive words just like any other — no
special declaration is needed for plain recursion.

```factor
: total ( seq -- sum )
    [ 0 ] [ unclip swap total + ] if-empty ;

{ 4 0 9 0 5 } total .    ! => 18
```

The two halves are the recursion's *base case* (here, the empty
sequence sums to `0`) and the *recursive step* (peel one element
off, recurse on the rest, combine the results).

`if-empty` and `unclip` are the canonical companions for sequence
recursion. `if-empty ( seq emptyquot nonemptyquot -- )` runs one
of two quotations depending on the sequence; `unclip` peels the
first element off so the recursive step has something simpler.
