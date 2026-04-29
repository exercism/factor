# About

Four words from [`grouping`][grouping] and
[`splitting`][splitting] cover almost every "cut a sequence into
pieces" need:

```factor
USING: grouping kernel sequences splitting splitting.monotonic ;

! Disjoint chunks of N elements
{ 1 2 3 4 5 6 7 } 3 group .
! => { { 1 2 3 } { 4 5 6 } { 7 } }

! Overlapping sliding window of N elements
{ 1 2 3 4 5 } 2 clump .
! => { { 1 2 } { 2 3 } { 3 4 } { 4 5 } }

! Split wherever a predicate fires on an element
{ 1 2 0 3 4 0 5 } [ zero? ] split-when .
! => { { 1 2 } { 3 4 } { 5 } }

! Group runs where adjacent elements are "the same" by some test
{ 1 1 2 2 2 3 } [ = ] monotonic-split .
! => { { 1 1 } { 2 2 2 } { 3 } }
```

| word              | effect                                                                  |
|-------------------|-------------------------------------------------------------------------|
| `group`           | `( seq n -- groups )` — disjoint *n*-sized chunks                       |
| `clump`           | `( seq n -- clumps )` — overlapping *n*-sized windows                   |
| `split-when`      | `( seq quot: ( elt -- ? ) -- pieces )` — break when quot is truthy      |
| `monotonic-split` | `( seq quot: ( a b -- ? ) -- pieces )` — break when *adjacent* quot is `f` |

A useful mental model:

- **`group` / `clump`** look at sizes; the *n* parameter says
  how big each window is.
- **`split-when`** looks at *single elements*; the predicate
  decides whether each element is a "break."
- **`monotonic-split`** looks at *pairs*; the predicate decides
  whether two adjacent elements still belong in the same run.

[grouping]: https://docs.factorcode.org/content/vocab-grouping.html
[splitting]: https://docs.factorcode.org/content/vocab-splitting.html
