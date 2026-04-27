# Instructions append

## Words

Define a `triangle` tuple with slots `a`, `b`, and `c`.

- `<triangle> ( a b c -- triangle )` — construct a triangle from
  three side lengths.
- `equilateral? ( triangle -- ? )`
- `isosceles? ( triangle -- ? )`
- `scalene? ( triangle -- ? )`

Each predicate returns `f` for triangles that violate the triangle
inequality or have a non-positive side.
