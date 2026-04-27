# Instructions append

## Words

Define a `robot` tuple with slots `x`, `y`, and `direction`. The
`direction` slot holds one of the symbols `north`, `east`, `south`,
or `west` (declared in this exercise's vocabulary).

- `<robot> ( x y direction -- robot )` — construct a robot.
- `move ( robot instructions -- robot )` — apply a string of `R`,
  `L`, and `A` instructions and return the updated robot.
