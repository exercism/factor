# Instructions

You're the ship's purser, managing the pantry inventory. The
inventory is a hashtable where each key is an item name and the
value is the quantity in stock.

## 1. Build an inventory from a list

Define `create-inventory` to take a sequence of item names and
return a hashtable that pairs each unique name with its count.

```factor
{ "coal" "wood" "wood" "diamond" "diamond" "diamond" } create-inventory .
! => H{ { "coal" 1 } { "wood" 2 } { "diamond" 3 } }
```

## 2. Add more items

Define `add-items` to take an inventory and a sequence of items and
return a new inventory whose counts have been incremented for each
listed item. The original inventory should not be modified.

```factor
H{ { "coal" 1 } } { "wood" "iron" "coal" "wood" } add-items .
! => H{ { "coal" 2 } { "wood" 2 } { "iron" 1 } }
```

## 3. Decrement counts

Define `decrement-items` to take an inventory and a sequence of
items and return a new inventory whose counts have been decreased
by one for each listed item. Counts must never fall below zero, and
items not already in the inventory should be left out (no negative
entries are inserted).

```factor
H{ { "coal" 3 } { "diamond" 1 } { "iron" 5 } }
{ "diamond" "coal" "iron" "iron" } decrement-items .
! => H{ { "coal" 2 } { "diamond" 0 } { "iron" 3 } }
```

## 4. Remove an item entirely

Define `remove-item` to take an inventory and an item and return a
new inventory with that item removed. If the item isn't present,
return an unchanged copy.

```factor
H{ { "coal" 2 } { "wood" 1 } { "diamond" 2 } } "coal" remove-item .
! => H{ { "wood" 1 } { "diamond" 2 } }
```

## 5. List the available items

Define `list-inventory` to take an inventory and return an array of
`{ name quantity }` pairs containing only the items whose quantity
is greater than zero, sorted alphabetically by name.

```factor
H{ { "coal" 7 } { "wood" 11 } { "diamond" 2 } { "iron" 7 } { "silver" 0 } }
list-inventory .
! => { { "coal" 7 } { "diamond" 2 } { "iron" 7 } { "wood" 11 } }
```
