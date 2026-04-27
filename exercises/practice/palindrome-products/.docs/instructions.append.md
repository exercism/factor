# Instructions append

## Words

`smallest` and `largest` each return **two** stack values: the
palindrome value (or `f` if none exists in the range) and an
array of factor pairs.

- `smallest ( mn mx -- value factors )`
- `largest  ( mn mx -- value factors )`

Each pair in `factors` is a 2-element array `{ a b }`. Throw the
string `"min must be <= max"` if `mn > mx`.
