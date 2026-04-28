# About

Combinators turn stack-shuffling patterns into named, composable
words. Once you've written enough Factor, you stop thinking "I
need to `dup`, then run F, then keep the original" and just write
`[ F ] keep`.

| pattern                            | shuffles                      | combinator      |
|------------------------------------|-------------------------------|-----------------|
| apply F, preserve input            | `dup F swap`                  | `[ F ] keep`    |
| two functions of one input         | `dup F swap G`                | `[ F ] [ G ] bi`|
| three functions of one input       | hairy                         | `[ F ] [ G ] [ H ] tri` |
| many functions of one input        | very hairy                    | `{ Fs … } cleave`|
| operate on values *under* the top  | `swap F swap`                 | `[ F ] dip`     |
| same op on two values              | `swap F swap F`               | `[ F ] bi@`     |
| different ops on two values        | `swap F swap G`               | `[ F ] [ G ] bi*`|

The `2`-prefixed family (`2bi`, `2dip`, `2tri`, `2dup`, `2drop`,
`2swap`) does the same when each operation needs *two* inputs.
The `n*`-suffixed family scales arbitrarily.

Beyond the cleave/dip/bi family, [`kernel`][kernel] also offers
control-flow variants that propagate `f` cleanly:

| word        | effect                                              |
|-------------|-----------------------------------------------------|
| `if*`       | true branch sees the value; false branch doesn't    |
| `when*`     | one-branch form of `if*`                            |
| `unless*`   | keep the value if truthy, else compute a default    |
| `?last`     | last element of a sequence, or `f` if empty         |
| `pop*`      | discarding variant of `pop` (mutates a vector)      |
| `dupd`      | duplicate the *second*-from-top                     |
| `pick`      | copy the *third*-from-top to the top                |
| `with`      | bake a fixed value into a quotation for HOS         |
| `while`     | loop while a predicate holds                        |
| `until`     | loop until a predicate holds                        |

Choosing the right combinator is itself a skill. The general rule:
once a definition's body has more than one shuffle word in a row,
there's usually a combinator that captures the intent better.

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
