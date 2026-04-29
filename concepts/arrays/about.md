# About

Arrays are Factor's fixed-length, immutable sequence type.
Literals use `{ … }` with whitespace between elements; the
`arrays` vocabulary adds small constructors that pull values off
the stack:

| word     | effect                              |
|----------|-------------------------------------|
| `1array` | `( a     -- { a } )`                |
| `2array` | `( a b   -- { a b } )`              |
| `3array` | `( a b c -- { a b c } )`            |
| `array?` | `( obj   -- ? )` — type predicate   |

A few protocol words from `sequences` come up so often with
arrays that they are worth knowing as a unit:

| word      | effect                                                |
|-----------|-------------------------------------------------------|
| `concat`  | `( seqs -- seq )` — flatten a sequence-of-sequences   |
| `reverse` | `( seq -- newseq )`                                   |
| `index`   | `( elt seq -- i/f )` — index of element, or `f`       |
| `member?` | `( elt seq -- ? )` — membership test                  |

```factor
USING: arrays sequences ;

3 4 2array .                       ! => { 3 4 }
{ { 1 2 } { 3 4 } } concat .       ! => { 1 2 3 4 }
{ 1 2 3 4 } reverse .              ! => { 4 3 2 1 }
"b" { "a" "b" "c" } index .        ! => 1
"b" { "a" "b" "c" } member? .      ! => t
```
