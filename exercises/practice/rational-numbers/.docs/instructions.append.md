# Instructions append

## Words

Define a `rat` tuple with `numerator` and `denominator` slots.
`<rat>` should reduce its arguments to lowest terms, with the
sign on the numerator (so a denominator is always positive).

- `<rat> ( numerator denominator -- rat )` — construct a reduced
  rational.
- `>rat ( pair -- rat )` — build a `rat` from `{ numerator denominator }`.
- `rat>pair ( rat -- pair )` — return `{ numerator denominator }`.
- `r+ ( a b -- c )`, `r- ( a b -- c )`, `r* ( a b -- c )`,
  `r/ ( a b -- c )` — arithmetic on two rationals.
- `r-abs ( a -- |a| )` — absolute value.
- `r^ ( a n -- a^n )` — raise a rational to an integer power
  (negative exponents allowed).
- `real^r ( x a -- y )` — raise a real number to a rational
  exponent and return a float.

Factor's `MATH:` generics (`+`, `-`, `*`, `/`) only dispatch over
the built-in math hierarchy, so this exercise uses dedicated word
names rather than methods on those generics.
