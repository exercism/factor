# Introduction

Factor's threads are *cooperative coroutines* — they share one OS
thread, hand control to each other at I/O and at explicit yield
points, and never run truly simultaneously. Anything you do
*between* yields is effectively atomic. But if a compound
operation (read-modify-write) yields midway, another thread can
slip in and change the world before you finish — and that's a race.

This exercise covers four primitives that come up over and over:

## `parallel-map` — fork/join over a sequence

```
parallel-map ( seq quot: ( elt -- newelt ) -- newseq )
```

In [`concurrency.combinators`][combinators]. Spawns one thread per
element, runs the quotation, and collects the results back into a
new sequence in the same order:

```factor
USING: concurrency.combinators sequences ;

{ "alpha" "beta" "gamma" } [ length ] parallel-map .
! => { 5 4 5 }
```

## `spawn` — start a thread

```
spawn ( quot name -- thread )
```

In [`threads`][threads]. The quotation runs concurrently; `name`
is a label for debugging. The returned thread handle is mostly
uninteresting at this level — `drop` it.

## Promises — single-shot value handoff

```
<promise>           ( -- promise )
fulfill             ( value promise -- )
?promise            ( promise -- value )
```

In [`concurrency.promises`][promises]. A promise is a one-shot
mailbox: one thread fulfils it, others read it. `?promise` blocks
until the promise has been fulfilled, then returns the value.

```factor
USING: concurrency.promises kernel threads ;

<promise> [
    [ 42 swap fulfill ] curry "answer" spawn drop
] keep ?promise .
! => 42
```

`spawn` + `<promise>` is what `parallel-map` is built from;
hand-rolling them is useful when each task does something other
than "compute one element."

## Locks — mutual exclusion

```
<lock>     ( -- lock )
with-lock  ( lock quot -- )
```

In [`concurrency.locks`][locks]. Only one thread can hold a given
lock at a time. `with-lock` acquires, runs the quotation,
releases — even if the quotation throws.

```factor
USING: concurrency.locks kernel ;

<lock> :> guard
guard [ ! exclusive section ! ] with-lock
```

Use a lock whenever a value is *read or written by more than one
thread* and the operations on it aren't naturally atomic. Both
reads and writes need the lock — a read that yields midway can see
torn state.

[combinators]: https://docs.factorcode.org/content/vocab-concurrency.combinators.html
[locks]: https://docs.factorcode.org/content/vocab-concurrency.locks.html
[promises]: https://docs.factorcode.org/content/vocab-concurrency.promises.html
[threads]: https://docs.factorcode.org/content/vocab-threads.html
