# Introduction

Factor's numeric tower includes integers, ratios, and floats:

```factor
2 3 + .       ! => 5
1 2 / .       ! => 1/2     (rational, not 0)
2.0 3.0 + .   ! => 5.0
```

The arithmetic words `+`, `-`, `*`, `/` live in [`math`][math];
comparison words `<`, `<=`, `>`, `>=` are also there. Division
splits three ways: `/` is exact (integer-by-integer keeps a
ratio, never rounds), `/i` truncates to an integer, and `/f`
forces a float result.

`mod`, `sq`, `neg`, `abs`, `zero?` round out the basics. The
class predicates `integer?`, `float?`, `number?` are handy when
branching on the kind of number you hold. Float-specific helpers
like `floor`, `ceiling`, and `>integer` live in
[`math.functions`][math.functions] and `math` respectively.

[math]: https://docs.factorcode.org/content/vocab-math.html
[math.functions]: https://docs.factorcode.org/content/vocab-math.functions.html
