# Instructions

A pirate is plotting a route through a chart of hidden coves.
The chart is a hashtable keyed on cove name; each value is an
array of the coves you can reach directly from that one.

## 1. Drain the tide queue

Define `tide-queue` to take an array of items, push each onto a
fresh deque (in order), then pop them all back into an array
that preserves the original order. This is the FIFO shape:
push to the back, pop from the front.

```factor
{ "alpha" "bravo" "charlie" } tide-queue .
! => { "alpha" "bravo" "charlie" }
```

## 2. Coves reachable

Define `coves-reachable` to take a starting cove and a chart,
and return a hash-set of every cove reachable from `start` —
including `start` itself.

```factor
"Skull Bay" H{
    { "Skull Bay"   { "Hidden Cove" } }
    { "Hidden Cove" { "Reef Point"  } }
    { "Reef Point"  { } }
} coves-reachable .
! => HS{ "Skull Bay" "Hidden Cove" "Reef Point" }
```

Use a `<dlist>` as the BFS frontier and a `HS{ }` for the
visited set.

## 3. Hop count

Define `hop-count` to take a starting cove, a goal cove, and a
chart, and return the minimum number of hops between them — or
`f` if the goal isn't reachable.

```factor
"Skull Bay" "Hidden Cove"
H{
    { "Skull Bay"   { "Hidden Cove" } }
    { "Hidden Cove" { } }
} hop-count .
! => 1
```

Carry each cove together with its distance from the start in the
deque (a 2-element array works).

## 4. Gold count

Define `gold-count` with `MEMO:` (not `:`) so the result for
each cove is computed once and cached. Look up the gold for the
cove in the `gold-distribution` constant the exercise provides.
A cove that isn't in the distribution has zero gold.

```factor
"Smuggler's Hollow" gold-count .   ! => 200
"Davy Jones' Locker" gold-count .  ! => 0
```

## 5. Treasure route

Define `treasure-route` to take a starting cove and a chart, and
return the reachable cove with the most gold. Use
`coves-reachable` from task 2 and `gold-count` from task 4.

```factor
"Skull Bay" some-chart treasure-route .
! => "Smuggler's Hollow"   (the richest reachable cove)
```

The memoised `gold-count` keeps repeat lookups free — useful
when several pieces of the algorithm consult the same cove.
