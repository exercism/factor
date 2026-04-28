# Instructions

You're running an online fashion boutique. Each item in your
inventory is a 2-element array `{ name price }`, and the whole
inventory is an array of items.

```factor
{ "Bamboo Socks Cats" 20 }
```

A missing price is recorded as `f`.

## 1. Sort the inventory by price

Define `sort-by-price` to return a new array with the items sorted by
price, ascending.

```factor
{ { "Maxi Brown Dress" 65 } { "Red Skirt" 50 } { "Bamboo Socks Cats" 20 } }
sort-by-price .
! => { { "Bamboo Socks Cats" 20 } { "Red Skirt" 50 } { "Maxi Brown Dress" 65 } }
```

## 2. Find items with no price set

Define `with-missing-price` to return an array of just the items
whose price is `f`.

```factor
{ { "Black T-shirt" 40 } { "Denim Pants" f } { "Orange T-shirt" 40 } }
with-missing-price .
! => { { "Denim Pants" f } }
```

## 3. Count expensive items

Define `expensive-items` to take an inventory and a price
threshold, and return how many items cost strictly more than the
threshold.

```factor
{ { "Skirt" 50 } { "Coat" 120 } { "Hat" 25 } { "Dress" 80 } }
50 expensive-items .
! => 2

{ { "Skirt" 50 } { "Coat" 120 } { "Hat" 25 } { "Dress" 80 } }
0 expensive-items .
! => 4
```

## 4. Find the cheapest item

Define `cheapest-item` to return the item with the lowest price.
Items with no price (`f`) won't appear in the input.

```factor
{ { "Skirt" 50 } { "Coat" 120 } { "Hat" 25 } } cheapest-item .
! => { "Hat" 25 }
```

## 5. Sum all the prices

Define `total-price` to return the sum of all the prices. Items with
no price (`f`) won't appear in the input.

```factor
{ { "Skirt" 50 } { "Coat" 120 } { "Hat" 25 } } total-price .
! => 195
```

## 6. Format an item as a price tag

Define `format-price-tag` to return a string of the form `"name: $price"`
for an item. Items with no price (`f`) won't appear here.

```factor
{ "Skirt" 50 } format-price-tag .
! => "Skirt: $50"
```
