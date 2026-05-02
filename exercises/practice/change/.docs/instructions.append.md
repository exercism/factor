# Instructions append

## Words

`find-fewest-coins ( coins target -- result )` returns an array
of coin denominations whose sum is `target`. `coins` is a hash
set (e.g. `HS{ 1 5 10 25 }`); use the words in the `sets`
vocabulary (`members`, `in?`, …) to work with it.

When no combination of `coins` can make `target`, throw a
`cannot-make-change` error.
