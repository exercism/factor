# About

The [`sequences`][sequences] vocabulary defines a single
[protocol][sequence-protocol] that arrays (`{ … }`), vectors (`V{ … }`), strings, ranges, and
slices all implement. Anything you can do with one, you can do
with the others.

| word        | effect                            |
|-------------|-----------------------------------|
| `length`    | `( seq -- n )`                    |
| `first`     | `( seq -- elt )`                  |
| `second`    | `( seq -- elt )`                  |
| `third`     | `( seq -- elt )`                  |
| `fourth`    | `( seq -- elt )`                  |
| `last`      | `( seq -- elt )`                  |
| `rest`      | `( seq -- tailseq )`              |
| `but-last`  | `( seq -- headseq )`              |
| `nth`       | `( n seq -- elt )` (0-based)      |
| `head`      | `( seq n -- headseq )`            |
| `head*`     | `( seq n -- headseq )` (all but last n) |
| `tail`      | `( seq n -- tailseq )`            |
| `tail*`     | `( seq n -- tailseq )` (last n)   |
| `subseq`    | `( from to seq -- newseq )`       |
| `remove-nth`| `( n seq -- newseq )`             |
| `pad-head`  | `( seq n elt -- padded )`         |
| `pad-tail`  | `( seq n elt -- padded )`         |
| `prefix`    | `( seq elt -- newseq )`           |
| `suffix`    | `( seq elt -- newseq )`           |
| `unclip`    | `( seq -- rest first )`           |
| `unclip-last` | `( seq -- butlast last )`       |
| `empty?`    | `( seq -- ? )`                    |
| `if-empty`  | `( seq emptyquot nonemptyquot -- … )` |
| `member?`   | `( elt seq -- ? )`                |
| `reverse`   | `( seq -- newseq )`               |
| `index`     | `( elt seq -- i/f )`              |
| `index-or-length` | `( elt seq -- i )` (length when absent) |
| `count`     | `( seq quot -- n )`               |
| `concat`    | `( seqs -- seq )`                 |
| `sum`       | `( seq -- n )`                    |
| `product`   | `( seq -- n )`                    |
| `find`      | `( seq quot -- i/f elt/f )`       |
| `find-last` | `( seq quot -- i/f elt/f )`       |
| `produce`   | `( pred quot -- seq )`            |

Arrays are immutable; the `prefix`/`suffix`/`append`/`prepend` operations all
return new sequences without modifying the original. Vectors are
mutable — `push` and `pop` work in place — but `clone` is the right
starting point if you want a fresh copy.

## Conversions

`>array`, `>string`, and `>vector` (in their respective vocabs)
coerce any sequence to the named concrete type. Use them when a
caller wants a specific representation, or to materialise a slice
or other lazy sequence.

```factor
USING: arrays sequences strings vectors ;

V{ 1 2 3 } >array  .   ! => { 1 2 3 }
{ 65 66 67 } >string . ! => "ABC"
"abc" >vector .        ! => V{ CHAR: a CHAR: b CHAR: c }
```

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
[sequence-protocol]: https://docs.factorcode.org/content/article-sequence-protocol.html
