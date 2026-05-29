# Introduction

Tuples can extend other tuples. `TUPLE: child < parent slots ;`
declares a class whose instances are also instances of `parent`
— they get the parent's slots in addition to their own, and the
parent's accessors work on them transparently.

```factor
USING: accessors ;

TUPLE: animal name age ;
TUPLE: dog < animal breed ;

"Rex" 4 "labrador" dog boa .
! => T{ dog { name "Rex" } { age 4 } { breed "labrador" } }

"Rex" 4 "labrador" dog boa name>> .   ! => "Rex"   (inherited accessor)
```

## `boa` slot order

The `boa` constructor takes slots in *declaration order, parents
first*. For `dog` above:

```
dog boa ( name age breed -- dog )
```

A grandchild `puppy < dog ` adding `weeks` would be:

```
puppy boa ( name age breed weeks -- puppy )
```

## Predicate hierarchy

Every `TUPLE:` declaration generates a predicate (`name?`).
With inheritance the predicates nest — every descendant
satisfies its ancestors' predicates:

```factor
"Rex" 4 "labrador" dog boa
dup dog? .        ! => t
dup animal? .     ! => t
```

The reverse isn't true: an `animal` that isn't a `dog` fails
`dog?`.

## Forward note

Generic methods (`M:`, taught in [`generics`][generics])
dispatch up the hierarchy too — a method on `animal` fires for
every descendant unless a more-specific override takes
priority. You'll see that in `boatswains-bilge` immediately
after this exercise.

[generics]: https://docs.factorcode.org/content/article-generic.html
