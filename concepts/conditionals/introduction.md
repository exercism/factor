# Introduction

`if` (in [`kernel`][kernel]) is Factor's basic conditional. It
takes a boolean and two quotations, running the first if the
boolean is truthy and the second otherwise.

```
if ( ? then-quot else-quot -- )
```

```factor
: abs ( x -- y ) dup 0 < [ neg ] [ ] if ;
```

`when` runs its quotation only when the boolean is truthy, `unless`
only when it is falsy. For multi-way branching there's `cond` (in
[`combinators`][combinators]):

```factor
USING: combinators ;

: classify ( n -- s )
    {
        { [ dup 0 <  ] [ drop "negative" ] }
        { [ dup 0 =  ] [ drop "zero"     ] }
        [ drop "positive" ]
    } cond ;
```

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
