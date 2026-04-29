# About

Factor's sequence library leans heavily on *quotations* — code in
`[ ]` brackets — to parameterise iteration. The shape is always the
same: pass a sequence and a quotation, and the higher-order word
runs the quotation against each element.

```factor
{ 1 2 3 4 5 } [ even? ] filter .   ! => { 2 4 }
{ 1 2 3 4 5 } [ even? ] reject .   ! => { 1 3 5 }
{ 1 2 3 4 5 } [ 3 > ] find .s      ! => 3 / 4 (index, element)
{ 1 2 3 4 5 } [ sq ] map .         ! => { 1 4 9 16 25 }
{ 1 2 3 4 5 } [ . ] each           ! prints each element
0 { 1 2 3 4 5 } [ + ] reduce .     ! => 15
```

The full common cast:

| word         | shape                                      |
|--------------|--------------------------------------------|
| `each`       | `( seq quot -- )`                          |
| `map`        | `( seq quot -- newseq )`                   |
| `filter`     | `( seq quot -- newseq )`                   |
| `reject`     | `( seq quot -- newseq )`                   |
| `find`       | `( seq quot -- i/f elt/f )`                |
| `find-last`  | `( seq quot -- i/f elt/f )`                |
| `reduce`     | `( seq init quot -- result )`              |
| `count`      | `( seq quot -- n )`                        |
| `any?`       | `( seq quot -- ? )`                        |
| `all?`       | `( seq quot -- ? )`                        |
| `with`       | `( value seq quot -- seq curry )`          |
| `without`    | `( seq exclude -- newseq )`                |
| `sort`       | `( seq -- sortedseq )`                     |
| `infimum`    | `( seq -- elt )`                           |
| `supremum`   | `( seq -- elt )`                           |

When *your* word forwards a runtime quotation to one of these
combinators, declare your word with `; inline` so the
combinator's effect inference can see the quotation's shape at
the call site. Words built only from literal quotations don't
need it.

Beyond the core sequence ops:

| vocab              | provides                                      |
|--------------------|-----------------------------------------------|
| `sorting`          | `sort`, `sort-by`                             |
| `math.statistics`  | `sum`, `map-sum`, `infimum`, `supremum`, `infimum-by`, `supremum-by`, `cum-sum`, `cum-product`, `cum-min`, `cum-max` |
| `grouping`         | `group`, `clump`, `monotonic-split`           |
| `sets`             | `members`, `all-unique?`                      |

Pairs (`bi`, `tri`) and "n-ary" combinators (`2map`, `2each`, `zip`)
extend the same pattern when the quotation needs more than one input.
