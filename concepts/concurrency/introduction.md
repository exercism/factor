# Introduction

Factor runs cooperative threads in a single OS process. They yield
control at I/O and at explicit `yield` calls, which makes
synchronisation simpler than in pre-emptively scheduled languages —
but races are still possible, since any thread can run between two
non-atomic operations on shared state. Factor's concurrency vocabs
provide the standard toolkit: `spawn` to start a thread, promises
for single-shot result handoff, `parallel-map` for fork/join over a
sequence, and locks for mutual exclusion.
