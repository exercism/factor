# Introduction

A `MACRO:` declaration is like `:`, but the body runs at *compile
time* and must return a quotation. The compiler substitutes that
returned quotation for the macro call. Because the body is
ordinary Factor code, building the result quotation is just
manipulating sequences of words.

```factor
USING: kernel macros sequences ;

MACRO: twice ( quot -- compound )
    dup append ;

: shout-twice ( name -- ) [ " ahoy!" append print ] twice ;
! At compile time, the call site is replaced with
! [ " ahoy!" append print " ahoy!" append print ].
```

The inputs to a macro are *literals at the call site*. Pass a
non-literal value and the compiler will refuse to specialise —
because the macro body needs the value at compile time, not at
runtime.

A close cousin is the `<< … >>` parse-time evaluation block,
which runs arbitrary Factor at compile time without the
quotation-return contract. Both fall under Factor's
[`macros`][macros] machinery.

[macros]: https://docs.factorcode.org/content/vocab-macros.html
