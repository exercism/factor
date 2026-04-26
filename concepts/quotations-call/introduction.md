# Introduction

`call` (in [`kernel`][kernel]) runs a quotation. When the
quotation's stack effect can't be inferred — typically because
the quotation came from somewhere else — declare the effect on
`call` explicitly:

```
call( stack-effect ) ! e.g. call( a b -- c )
```

```factor
3 4 [ + ] call .                 ! => 7
3 4 [ + ] call( a b -- c ) .     ! => 7

: apply-binary ( a b op -- c )
    call( a b -- c ) ;

5 3 [ - ] apply-binary .         ! => 2
```

Because quotations are values, an array can carry a mix of numbers
and quotations — making "a program" just another sequence:

```factor
{ [ 1 + ] [ 2 * ] } 5 swap [ call( x -- y ) ] each .   ! 5 -> 6 -> 12
```

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
