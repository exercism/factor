# About

The [`sequences`][sequences] vocabulary defines a single protocol
that arrays (`{ … }`), vectors (`V{ … }`), strings, ranges, and
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
| `tail`      | `( seq n -- tailseq )`            |
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
| `concat`    | `( seqs -- seq )`                 |
| `sum`       | `( seq -- n )`                    |
| `product`   | `( seq -- n )`                    |
| `find`      | `( seq quot -- i/f elt/f )`       |
| `find-last` | `( seq quot -- i/f elt/f )`       |
| `produce`   | `( pred quot -- seq )`            |

Arrays are immutable; the `prefix`/`suffix`/`append` operations all
return new sequences without modifying the original. Vectors are
mutable — `push` and `pop` work in place — but `clone` is the right
starting point if you want a fresh copy.

[sequences]: https://docs.factorcode.org/content/vocab-sequences.html
