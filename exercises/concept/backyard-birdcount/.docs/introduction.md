# Introduction

Most of the time Factor handles iteration through combinators like
`each`, `map`, and `count`. Sometimes, though, the cleanest way to
spell a computation is **recursion** — a word that calls itself.

## Defining a recursive word

A `:` definition can call itself directly. The compiler can usually
infer the stack effect; if it can't, you can add the `recursive`
modifier to ask it to assume self-consistency:

```factor
: count-down ( n -- )
    dup 0 = [ drop ] [ dup . 1 - count-down ] if ;

5 count-down
! prints 5 4 3 2 1
```

## Splitting a sequence into head and tail

`unclip` (in [`sequences`][sequences]) peels the first element off a
sequence:

```
unclip ( seq -- rest first )
```

```factor
{ 4 0 9 } unclip .s
! => { 0 9 }
! => 4
```

`first` and `rest` give you the same two pieces *without* destructuring
in one step:

```factor
{ 4 0 9 } first .   ! => 4
{ 4 0 9 } rest .    ! => { 0 9 }
```

## Empty-or-not branching

`if-empty` (in [`sequences`][sequences]) is the natural recursion
base case:

```
if-empty ( seq emptyquot nonemptyquot -- )
```

```factor
{ 4 0 9 } [ "empty" ] [ "got data" ] if-empty .
! => "got data"
```

`emptyquot` runs with the (empty) sequence already consumed;
`nonemptyquot` runs with the sequence still on the stack.

## `cond` — a chain of guarded branches

When your recursion has more than two cases, `cond` (in
[`combinators`][combinators]) keeps the code readable:

```factor
: classify ( n -- label )
    {
        { [ dup 0 < ] [ drop "negative" ] }
        { [ dup 0 = ] [ drop "zero"     ] }
        [ drop "positive" ]
    } cond ;
```

## `prefix` — building a sequence

`prefix` (in [`sequences`][sequences]) is `suffix` from the other end:

```
prefix ( seq elt -- newseq )
```

```factor
{ 7 9 } 3 prefix .
! => { 3 7 9 }
```

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
