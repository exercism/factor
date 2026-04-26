# Instructions

You're apprenticing at a small furniture workshop. The master
carpenter's tablet runs Factor and tracks the cut list — every
board that lands on the workbench gets measured up with a few
derived values before the first cut is made.

The previous apprentice left the till code in a jungle of `dup`,
`over`, `swap`, and `rot`. Your job is to rewrite five small words
using *combinators*.

Each board enters the workflow with just its raw `length` (cm) on
the stack.

## 1. Add the kerf allowance

Saw blades remove a thin strip of wood from every cut — the *kerf*.
The shop budgets 2% extra length on every board to absorb it.

Define `with-kerf` to take a length and return the length plus its
2% kerf allowance.

```factor
100 with-kerf .
! => 102
```

## 2. Compute kerf and finish allowances

After cutting comes finishing — sanding and planing — which removes
another 5% of the original length.

Define `kerf-and-finish` to return *both* allowances side by side
(kerf below, finish on top).

```factor
100 kerf-and-finish .s
! => 2
! => 5
```

## 3. Build the cut card

Every board the master cuts gets a small card stuck on it that lists
the raw length, the kerf allowance, and the finish allowance — three
numbers, in that order.

Define `cut-card` to return all three.

```factor
100 cut-card .s
! => 100
! => 2
! => 5
```

## 4. Per-piece length

The shop also receives bulk *bolts* of timber that need dividing
into equal pieces. The kerf allowance is added to the bolt's length
once, then the result is divided by the number of pieces.

Define `per-piece` to take the bolt's length and the number of
pieces — the piece count is on top of the stack — and return the
per-piece length.

```factor
100 2 per-piece .
! => 51

100 4 per-piece .
! => 25+1/2
```

## 5. Compare two bolts

Sometimes the master is choosing between two bolts at the lumber
yard and wants to compare their kerf allowances at a glance.

Define `compare-bolts` to take two lengths off the stack and return
the kerf allowance for each (in the same order).

```factor
50 100 compare-bolts .s
! => 1
! => 2
```

## 6. A scoped kerf factor

The shop wants the kerf factor to be configurable per job without
threading it through every call. Define a SYMBOL `kerf-factor`, then
`current-kerf` to return `length * kerf-factor`, falling back to
`1/50` when `kerf-factor` is unbound.

```factor
100 current-kerf .
! => 2
```

Callers bind a custom factor with `with-variable`:

```factor
1/100 kerf-factor [ 100 current-kerf ] with-variable .
! => 1

1/20 kerf-factor [ 100 current-kerf ] with-variable .
! => 5
```
