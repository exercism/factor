# Hints

## General

- Declare the four cardinal symbols and four relative-bearing
  symbols with one `SYMBOLS:` line:
  `SYMBOLS: north east south west ahead starboard behind port ;`
- Each tuple is declared with `TUPLE: <class> <slot1> <slot2> ;`.
- A `GENERIC:` line declares the word; each `M:` line adds a
  method for one class. Use `M::` if you want named locals in
  the method body.

## 1. `>cartesian` for cardinal

- A small `case` over the four direction symbols is enough.
- `{ north [ 0 1 ] }` — the body just pushes the two values; the
  test expects `x` below `y` on the stack.

## 2. `>cartesian` for polar

- Convert degrees to radians: `bearing pi * 180 /`.
- `sin` and `cos` are in `math.functions`.
- Push `magnitude * sin(rad)` then `magnitude * cos(rad)`.

## 3. `>cartesian` for relative

- Declare a dynamic variable: `SYMBOL: heading`.
- Read it in your method with `heading get`.
- Map `ahead/starboard/behind/port` to a `0/90/180/270` offset
  with a `case`, then add the heading. From there it's the same
  polar conversion as task 2 — consider factoring out a helper
  `: deg>cartesian ( magnitude bearing -- x y ) ... ;`.

## 4. `flip`

- `change-direction` on a `cardinal` and `change-bearing` on a
  `polar` or `relative` build a new tuple with one slot
  modified, leaving the rest alone:
  `[ <transformation-quotation> ] change-bearing`.
- For `polar`'s rotation: `[ 180 + 360 mod ] change-bearing`.

## 5. `add-bearings`

- Call `>cartesian` on each input, then add the x-components and
  the y-components. Locals make this readable:
  ```factor
  :: add-bearings ( a b -- x y )
      a >cartesian :> ay :> ax
      b >cartesian :> by :> bx
      ax bx +
      ay by + ;
  ```
