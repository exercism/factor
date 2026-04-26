# Introduction

A *quotation* — code in `[ ]` brackets — is a first-class value in
Factor. You can store one in a variable, put one in an array, pass
one to another word, and *call* it later.

## `call`

`call` (in [`kernel`][kernel]) runs a quotation:

```factor
3 4 [ + ] call .
! => 7
```

When you `call` a quotation in a context where Factor cannot infer
its stack effect, you must declare the effect explicitly:

```
call( stack-effect ) ! e.g. call( a b -- c )
```

```factor
: apply-binary ( a b op -- c )
    call( a b -- c ) ;

5 3 [ - ] apply-binary .
! => 2
```

This compiles a runtime check that the quotation actually has the
declared effect.

## Quotations in sequences

Because quotations are values, an array can hold a mix of numbers
and quotations:

```factor
{ 3 4 [ + ] }
```

That makes "a program" a regular sequence, and `each` becomes a
natural way to run one:

```
each ( seq quot -- )
```

```factor
{ [ 1 + ] [ 2 * ] } 5 swap [ call( x -- y ) ] each .
! 5 -> 6 -> 12
```

## Slicing the end of a sequence

`head*` returns everything except the last `n` elements; `last2`
returns the final two:

```
head* ( seq n -- headseq )
last2 ( seq -- penultimate last )
```

```factor
{ 1 2 3 4 } 2 head* .    ! => { 1 2 }
{ 1 2 3 4 } last2 .      ! => 3 4
```

Together with `suffix`, that's everything you need to write a
"consume the top two, push one result" stack operation.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
