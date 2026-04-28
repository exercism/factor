# Introduction

Arrays are Factor's primary fixed-length, immutable sequence
type, written `{ … }`. The `arrays` and `sequences` vocabularies
together give you small constructors that take values off the
stack, plus everyday operations for joining, reversing, and
looking up elements.

```factor
USING: arrays sequences ;

42 1array .                ! => { 42 }
"a" "b" "c" 3array .       ! => { "a" "b" "c" }
{ { 1 2 } { 3 4 } } concat .   ! => { 1 2 3 4 }
{ 1 2 3 } reverse .            ! => { 3 2 1 }
```

[arrays]: https://docs.factorcode.org/content/vocab-arrays.html
[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
