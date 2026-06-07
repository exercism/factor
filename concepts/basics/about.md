# About

Factor's only data-passing convention is the *data stack*: words pop
their inputs and push their outputs. Every word definition declares a
*stack effect* documenting that contract.

```factor
: restow ( a b -- b a ) swap ;
: discard-top ( a b -- a ) drop ;
```

The names inside `( … -- … )` are for the reader's benefit; what the
compiler checks is the *number* of inputs and outputs. A mismatch is a
compile-time error, which catches a class of bugs that would be runtime
errors in a dynamically-typed language without this kind of
declaration.

Because the stack is positional, you constantly need to rearrange its
top before the next word can run. The `kernel` **shuffle words** do
exactly that:

```
dup   ( x   -- x x   )    ! duplicate the top
drop  ( x   --       )    ! discard the top
swap  ( x y -- y x   )    ! flip the top two
over  ( x y -- x y x )    ! copy the second item onto the top
nip   ( x y -- y     )    ! discard the second item
rot   ( x y z -- y z x )  ! roll the third item up to the top
```

The full shuffle family extends these with `-rot` (roll the other
way), the `d`-suffixed cousins that act one item deeper (`dupd`,
`swapd`), the `2`-prefixed cousins that act on pairs (`2dup`, `2drop`,
`2nip`), and others such as `pick` and `tuck`. They are introduced as
later exercises need them; reaching for too many shuffle words at once
is usually a sign that a *local* (named value) would read better.

By convention, words use `lowercase-kebab-case`, predicates end in `?`
and produce a boolean (`even?`, `empty?`), setters are written
`>>name` and getters `name>>`, and a word and its mutating variant
often share a name, distinguished only by context.
