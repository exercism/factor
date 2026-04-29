# About

Factor's threads are *cooperative coroutines* on a single OS thread.
A thread runs until it explicitly yields or performs blocking I/O,
at which point the scheduler picks another runnable thread. Two
implications:

- Anything between yields is effectively atomic.
- True multi-core parallelism requires going outside the standard
  `threads` vocab (e.g. `concurrency.distributed` for multi-process
  designs).

The standard concurrency primitives are layered:

| Vocab                       | Provides                               |
|-----------------------------|----------------------------------------|
| `threads`                   | `spawn`, `yield`, thread identity      |
| `concurrency.promises`      | `<promise>`, `fulfill`, `?promise`     |
| `concurrency.locks`         | `<lock>`, `with-lock`                  |
| `concurrency.combinators`   | `parallel-map`, `parallel-each`        |
| `concurrency.semaphores`    | `<semaphore>`, `acquire`, `release`    |
| `concurrency.mailboxes`     | per-thread inboxes, `send`, `receive`  |
| `concurrency.channels`      | rendezvous handles, `to`, `from`       |

```factor
USING: concurrency.combinators concurrency.locks
concurrency.promises kernel sequences threads ;

! parallel-map: fork-join, in order
{ "alpha" "beta" "gamma" } [ length ] parallel-map .
! => { 5 4 5 }

! spawn + promise: hand-rolled fork-join
<promise> [
    [ "hello, world" swap fulfill ] curry "greeter" spawn drop
] keep ?promise .   ! => "hello, world"

! <lock> + with-lock: protect a shared mutable slot
<lock> :> guard
guard [ "do thing under lock" drop ] with-lock
```

`parallel-map` is the high-level API and what idiomatic Factor reaches
for first. The `spawn` / `<promise>` / `?promise` triple is what
`parallel-map` is built from — handy when the iteration shape doesn't
fit map (e.g. spawning workers that talk back through other channels).

Locks protect *shared mutable state* — typically a tuple slot or a
hashtable that more than one thread reads or writes. Treat both reads
and writes as needing the lock if there's any non-atomic compound
update; missing a lock on either side is the classic recipe for a
torn read.
