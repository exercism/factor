# Introduction

Stack juggling is fine for short words. When a word has several
inputs and you need to refer to them by name, Factor offers
*locals* — named bindings introduced with `::` (for word
definitions) or `[| | ]` (for inline lambdas), both from
[`locals`][locals].

```factor
USING: locals ;

:: hypotenuse ( a b -- c )
    a a *
    b b *
    + sqrt ;
```

Inside a quotation, `[| inputs | body ]` is a lambda with named
inputs:

```factor
USING: assocs locals ;

H{ { "a" 1 } { "b" 2 } }
[| key value | key value 10 * ] assoc-map .
! => H{ { "a" 10 } { "b" 20 } }
```

[locals]: https://docs.factorcode.org/content/vocab-locals.html
