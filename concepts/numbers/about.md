# About

Factor's numeric tower automatically promotes between integer,
ratio, and floating-point values. `1 2 /` evaluates to the *exact*
rational `1/2` — no truncation, no float coercion. To force a float
result you use `1.0 2 /`.

```factor
3 4 + .         ! => 7
1 2 / .         ! => 1/2
1 2 / 4 * .     ! => 2
2.5 floor .     ! => 2.0
2.5 >integer .  ! => 2
```

Most arithmetic lives in [`math`][math]: `+`, `-`, `*`, `/`, `mod`,
`/i`, `/mod`, `gcd`, `abs`, `neg`, `sq`, `^`. Predicates: `zero?`,
`even?`, `odd?`, `positive?`, `negative?`. Comparison: `<`, `<=`,
`>`, `>=`, `=`. From [`math.order`][math.order]: `min`, `max`,
`between?`. From [`math.functions`][math.functions]: `floor`,
`ceiling`, `round`, `divisor?`. From [`math.primes`][math.primes]:
`prime?`. Constructors and conversions like `>integer`, `>float`,
`>fraction` are nearby.

[math]: https://docs.factorcode.org/content/vocab-math.html
[math.order]: https://docs.factorcode.org/content/vocab-math.order.html
[math.functions]: https://docs.factorcode.org/content/vocab-math.functions.html
[math.primes]: https://docs.factorcode.org/content/vocab-math.primes.html
