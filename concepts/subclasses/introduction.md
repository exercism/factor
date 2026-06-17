# Introduction

A tuple class can extend another tuple class with the `<` parent
syntax. The child gets the parent's slots in addition to its
own, and every instance of the child is also an instance of the
parent — `child?` implies `parent?`, all the way up the
hierarchy.

```factor
TUPLE: animal name age ;
TUPLE: dog < animal breed ;

"Rex" 4 "labrador" dog boa name>> .    ! => "Rex"   (inherited slot)
"Rex" 4 "labrador" dog boa dog? .      ! => t
"Rex" 4 "labrador" dog boa animal? .   ! => t       (also an animal)
```

The `boa` ("by order of arguments") constructor takes parent
slots first, in declaration order, then the child's own slots.
The auto-generated accessors (`name>>`, `>>name`, `change-name`)
inherit too: any word that takes an `animal` works on a `dog`.

When the class to test against is a value rather than a fixed
name, `instance?` does the same job as the `name?` predicate but
takes the class on the stack:

```factor
USING: classes ;

"Rex" 4 "labrador" dog boa dog instance? .      ! => t
"Rex" 4 "labrador" dog boa animal instance? .   ! => t
```

`obj dog instance?` is just `obj dog?` with the class supplied at
run time — handy when the class is passed in or chosen
dynamically.

Generic methods dispatched on the parent fire for every
descendant — but that lesson lives with [`generics`][generics];
this exercise stays focused on the data side.

[generics]: https://docs.factorcode.org/content/article-generic.html
