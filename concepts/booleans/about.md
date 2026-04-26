# About

Factor's boolean type is built around two constants: `t` and `f`.
Most predicate words (those whose name ends in `?`) push one of
these — `even?`, `empty?`, `zero?`, `>=`, `=`.

The three classical operators live in `kernel`:

```factor
t f and .    ! => f
t f or .     ! => t
f not .      ! => t
```

Unlike many languages with a notion of "truthiness", Factor's rule
is straightforward: `f` is the *only* falsy value. Everything
else — including the empty string `""`, the number `0`, and the
empty array `{ }` — counts as truthy. That makes `f` an unambiguous
"missing value" in patterns like `at` (returns `f` if a key isn't
in a hashtable) and `unless*` (push a default if the value is `f`).
