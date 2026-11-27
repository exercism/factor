# Hints

## General

- Add `math.functions` and `math.constants` to your `USING:` line.
  Task 3 also needs `math.libm`.
- The tests allow a tiny tolerance, so the order you multiply and
  divide in does not matter.

## 1. Rope for the boundary

- Three things multiplied together, one of them `pi`.

## 2. How far from the pitch?

- `[ sq ] bi@` squares both numbers on top of the stack.
- Add the squares, then call `sqrt`.

## 3. Which way did it go?

- `fatan2` wants the across distance `y` *below* the down-the-ground
  distance `x`, which is the opposite of the order they arrive in.
  `swap` them first.
- Its answer is in radians. `rad>deg` turns it into degrees.

## 4. How far did it carry?

- `sin` wants radians, and `angle` is in degrees. Convert it with
  `deg>rad` first, then double it.
- `bi*` applies one quotation to `speed` and another to `angle`:
  `[ sq ] [ ... ] bi*`.

## 5. Slowing on the grass

- *e* to a power is `e^`, called on the power: work out
  `-0.02 * metres` first.

## 6. Where will it stop being worth chasing?

- Call `log` on `speed / target`, then divide by `0.02`.
