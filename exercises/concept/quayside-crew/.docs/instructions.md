# Instructions

It's the night shift down at Hull's quayside. The freighter
*Olwen* is moored alongside, and a crew of dockhands works the
manifest in parallel. Every crate must be weighed before it
goes aboard, and the harbour master keeps a single running
**tonnage tally** that every hoist updates. The catch: there is
only one quayside crane, so the tally cannot be torn by two
dockhands updating it at the same time.

Each crate is an array of item weights. Crate weight is the sum
of those items.

## 1. Weigh a crate

Define `weigh-crate` to take a crate and return its total weight.
This is plain sequential work — one crate, one number out.

```factor
{ 12 8 15 } weigh-crate .
! => 35
```

## 2. Weigh the whole manifest in parallel

Define `weigh-all` to take an array of crates and return the
array of their weights, in the same order. Use `parallel-map`
so the per-crate work happens concurrently.

```factor
{ { 5 5 } { 10 } { 3 4 5 } } weigh-all .
! => { 10 10 12 }
```

## 3. Build a fresh crane

Define `<crane>` to construct a new crane: a tuple with a fresh
`<lock>` and a tonnage of `0`. The crane is the shared resource
that subsequent tasks will protect.

```factor
<crane> tonnage>> .
! => 0
```

## 4. Hoist a crate onto the running tally

Define `hoist-crate` to take a `weight` and a `crane` and add
the weight to the crane's tonnage **under the crane's lock**, so
the read-add-write is atomic against other dockhands hoisting
at the same time.

```factor
<crane>
dup 35 swap hoist-crate
dup 17 swap hoist-crate
tonnage>> .
! => 52
```

## 5. Read the running tonnage

Define `crane-tonnage` to return the crane's current tonnage —
also under the lock, so the read can't see a torn value mid-
hoist.

```factor
<crane>
dup 35 swap hoist-crate
crane-tonnage .
! => 35
```

## 6. Load the cargo

Define `load-cargo` to take an array of crates and a crane,
and **for each crate, spawn a dockhand thread** that weighs the
crate and hoists the weight onto the crane. The word returns
only once every dockhand has finished. Use `<promise>` and
`?promise` to coordinate the join.

```factor
<crane> :> crane
{ { 5 5 } { 10 } { 3 4 5 } } crane load-cargo
crane crane-tonnage .
! => 32
```
