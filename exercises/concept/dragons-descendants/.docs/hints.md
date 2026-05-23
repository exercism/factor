# Hints

## General

- `TUPLE:` and `boa` are declared in `kernel`-adjacent vocabs —
  no special USING needed for declaring the class. Accessor
  words come from [`accessors`][accessors].

## 1. The base class

- `TUPLE: dragon name color age ;` declares the class with its
  three slots in order. `<dragon>` is one line: `dragon boa`.

## 2. The fire breathers

- The `<` parent syntax inherits the parent's slots:
  `TUPLE: fire-dragon < dragon flame-temp ;`. The `boa`
  constructor takes parent slots first.

## 3. The ice breathers

- Same shape as task 2 with a different extra slot. Sibling
  subclasses don't interact — `fire-dragon` and `ice-dragon`
  both subclass `dragon` directly.

## 4. The volcano dwellers

- Subclass `fire-dragon` (not `dragon` directly), so the
  `volcano-dragon` inherits both `dragon`'s slots and
  `fire-dragon`'s `flame-temp`. The `boa` constructor takes
  five values: name, color, age, flame-temp, lava-volume.

## 5. Aging any dragon

- `change-age` is the mutating accessor — `( tuple quot -- tuple )`
  applies the quotation to the current age and writes back.
  `[ 1 + ] change-age drop` increments and discards the returned
  tuple. Because every descendant inherits the slot, the same
  word works on each.

[accessors]: https://docs.factorcode.org/content/vocab-accessors.html
