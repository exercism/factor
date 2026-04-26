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

The `2`-prefixed family (`2bi`, `2dip`, `2tri`) does the same when
each operation needs *two* inputs. The `n*`-suffixed family scales
arbitrarily.

Choosing the right combinator is itself a skill. The general rule:
once a definition's body has more than one shuffle word in a row,
there's usually a combinator that captures the intent better.
