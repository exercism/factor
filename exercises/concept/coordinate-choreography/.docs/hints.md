# Hints

## General

- A "transformation" is a quotation `( point -- point' )` where a
  point is a 2-array.
- `2array` (in [`arrays`][arrays]) packs the top two stack values
  into a 2-array.

## 1. Translate the coordinates

- `v+` from [`math.vectors`][math.vectors] adds two vectors element-
  wise.
- Build the offset as a 2-array, then `curry` it into `[ v+ ]`.

## 2. Scale the coordinates

- Same pattern as task 1 with `v*` instead of `v+`.

## 3. Compose two transformations

- `compose` in [`kernel`][kernel] joins two quotations into one.

## 4. Apply a transformation

- The transformation's effect is `( p -- p' )`. Use
  `call( p -- p' )`.

## 5. Affine transform

- Four captures means fry: `'[ … _ … _ … _ … _ … ]`. The
  underscores are filled left-to-right with the captured stack
  values.
- One workable shape uses `first2` to push `x y`, `2dup` so each
  row of the matrix gets its own copy, and `[ _ * ] [ _ * ] bi*`
  to multiply each component by its coefficient. Wrap with `+` and
  `2array` to assemble the result.

[arrays]: https://docs.factorcode.org/content/vocab-arrays.html
[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[math.vectors]: https://docs.factorcode.org/content/vocab-math.vectors.html
