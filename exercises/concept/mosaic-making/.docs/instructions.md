# Instructions

You're volunteering at the community arts centre, where a long
ceramic-tile mosaic is going up over the front entrance. The
design team has laid the work out **row by row**: each row is an
array of tile colours, and the whole mosaic is an array of rows.

As volunteers cut, place, and rearrange tiles, you're writing
small reusable words to build, combine, and look up pieces of the
design.

## 1. A single-tile strip

Define `tile-strip` to take a colour and return a 1-element row
holding just that colour.

```factor
"sky-blue" tile-strip .
! => { "sky-blue" }
```

## 2. A row of three tiles

Define `row-of-three` to take three colours off the stack and
return a 3-element row.

```factor
"red" "white" "blue" row-of-three .
! => { "red" "white" "blue" }
```

## 3. Combine the rows into a flat tile list

The design team needs to sanity-check colour totals across all
rows of the mosaic. Define `combine-rows` to take an array of
rows and return a single sequence of every tile in order.

```factor
{ { "red" "white" } { "blue" "red" } } combine-rows .
! => { "red" "white" "blue" "red" }
```

## 4. Mirror a row

For symmetric panels the team mirrors a row before placing the
copy on the opposite side. Define `mirror-row` to return a row
in reverse order.

```factor
{ "red" "white" "blue" } mirror-row .
! => { "blue" "white" "red" }
```

## 5. Where is this colour in the row?

Define `tile-position` to take a row and a colour and return the
index (0-based) of the first tile with that colour in the row.
If the colour isn't present, return `f`.

```factor
{ "red" "white" "blue" } "white" tile-position .
! => 1

{ "red" "white" "blue" } "green" tile-position .
! => f
```

## 6. Does this row contain the colour?

Define `has-colour?` to take a row and a colour and return `t`
if the colour appears anywhere in the row, otherwise `f`.

```factor
{ "red" "white" "blue" } "white" has-colour? .
! => t

{ "red" "white" "blue" } "green" has-colour? .
! => f
```
