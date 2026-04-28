# Instructions

The community-arts-centre mosaic finished installing last
month, and now Magpie Marg has discovered it. Most days she
swaps a tile or two for shinier ones from her **hoard** nearby,
or plucks a tile out and disappears for an hour.

You're the volunteer who logs each change. The mosaic itself is
a **fixed-size array** — one slot per tile position, holding a
colour string or `f` for "missing". Magpie Marg's hoard is a
**vector** of loose tiles she's stolen.

## 1. Lay out a fresh row

Define `fresh-mosaic` to take a length `n` and return an array
of `n` empty slots (each `f`).

```factor
4 fresh-mosaic .
! => { f f f f }
```

## 2. Place a tile

Define `place-tile` to take a row, a position, and a colour, and
update the row in place so the named position holds that colour.
The word returns nothing.

```factor
5 fresh-mosaic   ! { f f f f f }
dup 2 "ruby" place-tile
.
! => { f f "ruby" f f }
```

## 3. Chip a tile out

Define `chip-tile` to take a row and a position, and update the
row in place so the named position becomes `f` again.

```factor
{ "ruby" "lapis" "jade" } 1 chip-tile .
! => { "ruby" f "jade" }
```

## 4. Re-colour a tile

Define `recolour-tile` to take a row, a position, and a one-arg
quotation, and update the row in place by applying the quotation
to the tile at that position.

```factor
{ "RUBY" "LAPIS" "JADE" } 1 [ >lower ] recolour-tile .
! => { "RUBY" "lapis" "JADE" }
```

## 5. Snapshot before Marg arrives

Define `snapshot-mosaic` to take a row and return an
independent copy that won't be affected by later mutations of
the original.

```factor
{ "ruby" "lapis" "jade" } dup snapshot-mosaic    ! two equal but independent copies
swap 0 "amber" place-tile                        ! mutate the first
.s
! => { "ruby" "lapis" "jade" }                   (the snapshot)
! => { "amber" "lapis" "jade" }                  (the mutated original)
```

## 6. Marg pockets a tile

Define `stash-tile` to take Marg's hoard (a vector) and a colour,
and append the colour to the hoard. Returns nothing.

```factor
V{ } clone   ! a fresh empty hoard
dup "ruby"  stash-tile
dup "lapis" stash-tile
.
! => V{ "ruby" "lapis" }
```

## 7. Marg returns a tile

Define `return-tile` to take Marg's hoard and remove and return
the most recently stashed tile (the one on top).

```factor
V{ "ruby" "lapis" "jade" } clone
dup return-tile .
! => "jade"
.
! => V{ "ruby" "lapis" }
```
