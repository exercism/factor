# Introduction

A *quotation* is a piece of code in `[ ]` brackets. It's a value:
you can push it on the stack, pass it to another word, or store it
in an array.

```factor
[ 1 + ] .          ! => [ 1 + ]
5 [ 1 + ] call .   ! => 6
```

Most higher-order words take a quotation as their second argument:

```factor
{ 1 2 3 } [ sq ] map .    ! => { 1 4 9 }
{ 1 2 3 } [ even? ] filter .  ! => { 2 }
```

The body of a quotation is just regular Factor code — the same
operators and stack effects you use everywhere else.
