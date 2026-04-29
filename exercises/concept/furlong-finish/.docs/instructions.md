# Instructions

It's race day at Furlong Park, and you're the steward at the
finish line. Horses cross in order, lanes need labels, and the
official ledger has to be annotated before the next race.

The horses' names arrive as an array, in finish order — the
0th name is the winner, the 1st is the runner-up, and so on.

## 1. Assign bibs

Define `assign-bibs` to take an array of horse names and return
an array of `{ position name }` pairs, position first.

```factor
{ "Bolt" "Comet" "Spirit" } assign-bibs .
! => { { 0 "Bolt" } { 1 "Comet" } { 2 "Spirit" } }
```

## 2. Lane labels

Define `lane-labels` to take an array of horse names and return
strings like `"Lane 0: Bolt"`.

```factor
{ "Bolt" "Comet" } lane-labels .
! => { "Lane 0: Bolt" "Lane 1: Comet" }
```

## 3. Tag the runners

Define `tag-runners` to take an array of horse names *and* a
tag string, returning labels of the form `"<tag>/<index>:
<name>"`. The same tag is baked into every label.

```factor
{ "Bolt" "Comet" } "Green" tag-runners .
! => { "Green/0: Bolt" "Green/1: Comet" }
```

## 4. Record the finishes

Define `record-finishes` to take an array of horse names and a
ledger (a vector). For every horse, append a string of the form
`"<index>: <name>"` to the ledger in place. Returns nothing.

```factor
V{ } clone   ! a fresh empty ledger
{ "Bolt" "Comet" } over record-finishes
.
! => V{ "0: Bolt" "1: Comet" }
```

## 5. Hoofbeats

Define `hoofbeats` to take a number `clops` and return a string
made of `"clop "` repeated `clops` times.

```factor
0 hoofbeats .   ! => ""
3 hoofbeats .   ! => "clop clop clop "
```
