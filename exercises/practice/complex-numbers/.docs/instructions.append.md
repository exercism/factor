# Instructions append

## Words

Define a `cmplx` tuple with slots `real` and `imaginary`. The
slot accessors `real>>` and `imaginary>>` come for free with the
tuple definition and are what the tests use to read components.

- `<cmplx> ( real imag -- cmplx )` — construct a complex number.
- `>cmplx ( pair -- cmplx )` — build a `cmplx` from
  `{ real imaginary }`.
- `cmplx>pair ( cmplx -- pair )` — return `{ real imaginary }`.
- `c+ ( a b -- c )`, `c- ( a b -- c )`, `c* ( a b -- c )`,
  `c/ ( a b -- c )` — arithmetic on two complex numbers.
- `c-abs ( a -- |a| )` — absolute value (a real).
- `c-conj ( a -- a* )` — complex conjugate.
- `c-exp ( z -- e^z )` — complex exponential.

Factor's `MATH:` generics (`+`, `-`, `*`, `/`) only dispatch over
the built-in math hierarchy, so this exercise uses dedicated word
names rather than methods on those generics.

Tests for arithmetic that mixes real numbers with complex numbers
are excluded — every operation here is between two `cmplx`
values.
