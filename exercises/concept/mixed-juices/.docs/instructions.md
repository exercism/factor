# Instructions

Your friend Li Mei runs a juice bar where she sells delicious
mixed fruit juices. You are a frequent customer in her shop and
realised you could make her life a little easier with some Factor
code.

## 1. Determine how long it takes to mix a juice

Li Mei likes to tell her customers in advance how long they have
to wait for a juice from the menu. She has a hard time
remembering the exact numbers because the time it takes to mix
the juices varies:

- `"Pure Strawberry Joy"` takes `0.5` minutes.
- `"Energizer"` and `"Green Garden"` take `1.5` minutes each.
- `"Tropical Island"` takes `3` minutes.
- `"All or Nothing"` takes `5` minutes.
- All other drinks (e.g., special offers) take `2.5` minutes.

Define `time-to-mix-juice` to take a juice name off the stack and
return the number of minutes it takes to mix that drink.

```factor
"Tropical Island" time-to-mix-juice .
! => 3

"Berries & Lime" time-to-mix-juice .
! => 2.5
```

## 2. Replenish the lime wedge supply

A lot of Li Mei's creations include lime wedges, either as an
ingredient or as part of the decoration. So when she starts her
shift in the morning she needs to make sure the bin of lime
wedges is full for the day ahead.

Define `wedges-from-lime` taking a lime size and returning the
number of wedges it produces — `6` from a `"small"` lime, `8`
from a `"medium"`, `10` from a `"large"`.

Then define `limes-to-cut` taking the number of `needed` wedges
and an array of `limes` (lime sizes in cut order). It cuts the
limes one by one, in order, and stops as soon as either it has
enough wedges or it runs out of limes. Return the number of
limes it had to cut.

```factor
25 { "small" "small" "large" "medium" "small" } limes-to-cut .
! => 4
```

## 3. List the times to mix each order in the queue

Li Mei likes to keep track of how long it will take to mix the
orders customers are waiting for.

Define `order-times` to take an array of orders and return an
array with the time to mix each order, in the same order.

```factor
{ "Energizer" "Tropical Island" } order-times .
! => { 1.5 3 }
```

## 4. Finish up the shift

Li Mei always works until 3 pm. Then her employee Dmitry takes
over. There are often drinks that have been ordered but not
prepared yet when Li Mei's shift ends; Dmitry will then prepare
the remaining juices.

To make the hand-over easier, define `remaining-orders` taking
the number of `time-left` minutes in Li Mei's shift and an array
of `orders` (juices that have been ordered but not prepared yet).
Return the orders Dmitry will need to take over — the ones Li
Mei does not have time to start before her shift ends.

`time-left` is always greater than `0`. The orders are prepared
in the order in which they appear in the array. Once Li Mei
starts a juice she always finishes it, even if she has to work a
little longer. If she has time to start every order, return an
empty array.

```factor
5 { "Energizer" "All or Nothing" "Green Garden" } remaining-orders .
! => { "Green Garden" }
```
