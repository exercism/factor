# Accretiveness audit — Factor concept exercises

## What "Accretive" means

A concept exercise ships a stub in which every word is `"unimplemented" throw ;`.
The exercise is **Accretive** if a student who correctly implements the first
*K* tasks (obeying every instruction for those tasks) and leaves the remaining
tasks as stubs sees **all tests for tasks 1..K pass**.

We want every concept exercise to be Accretive.

## How an exercise fails to be Accretive

The whole `<slug>-tests.factor` file is compiled as one unit before any test
runs (`[ require ] [ test ] bi` in `lib/exercism-tools/exercism-tools.factor`).
That gives two distinct failure modes.

**Mode A — compile-time.** A tuple class, tuple slot accessor (`foo>>`/`>>foo`),
constant, symbol, or word referenced anywhere in the tests is missing from the
stub and is introduced by a task *later than task 1*. Until that task is done
the entire test file fails to compile, so **no** task passes. Ordinary words are
safe because the stub pre-declares them all (they only `throw` at runtime); the
trap is a definition a later task adds. When the missing definition is created in
**task 1** (e.g. `lasagna`'s constant, `role-playing-game`'s tuple), the exercise
is still Accretive — doing task 1 makes the file compile.

**Mode B — runtime.** A test for task *K* calls a word the instructions assign
to a later task *M > K*. The file compiles, but that word is still a stub and
`throw`s, so task *K*'s test fails even though the student did tasks 1..K
correctly. This typically happens for opaque/stateful structures (a queue, set,
disjoint-set, mutable resource, global registry) whose task-*K* behaviour can
only be *observed* through a later task's word.

## Methodology

Verified empirically with the factor runtime, via `bin/check-accretive`:

- **Mode A:** compile the test file against the shipped stub. If it does not
  compile, the stub is missing a definition (Mode A — unless that definition is
  created in task 1).
- **Mode B:** for each prefix *K*, rebuild the exemplar with every word the
  instructions assign to a task *> K* re-stubbed (all tuples/constants/symbols
  kept, so compilation always succeeds and runtime ordering is isolated), strip
  `STOP-HERE`, run, and check that no test in tasks 1..K fails.

Run it with `FACTOR=/path/to/factor bin/check-accretive [slug...]`.

## Results

The initial audit found 11 of 47 not Accretive. The 5 Mode-B exercises have
since been fixed (test-only changes); 6 remain open (5 Mode A + 1 structural).

| Verdict | Count | Exercises |
|---|---|---|
| Accretive | 41 | all others |
| Mode A (open) | 5 | bering-bearings, boatswains-bilge, dragons-descendants, factory-failsafe, pirates-path |
| Mode B (fixed) | 5 | garden-gathering, lighthouse-logbook, poetry-club, quayside-crew, tellers-triage |
| Structural (open) | 1 | telegraphers-tape |

## Mode A — a definition is introduced after task 1

- **factory-failsafe** — `ERROR: machine-error` is created in task 3, but the
  tests reference `machine-error` / `machine-error?` (tasks 3–4). The stub only
  has a comment, so tasks 1–2 cannot compile.
  *Fix:* pre-ship the error class in the stub, exactly as `rpn-calculator`
  already ships `zero-divisor-error`.
- **pirates-path** — `gold-count` (a `MEMO:` word, task 4) is left as a comment
  in the stub instead of a stub body, so the tests reference an undefined
  `gold-count` and nothing compiles.
  *Fix:* pre-stub it, e.g. `MEMO: gold-count ( cove -- n ) "unimplemented" throw ;`.
- **dragons-descendants** — the subtuples `fire-dragon` / `ice-dragon` /
  `volcano-dragon` and their constructors are defined across tasks 2–4 (the stub
  is comment-only), so implementing only task 1 leaves them undefined.
  *Fix:* bundle all tuple/constructor definitions into task 1.
- **bering-bearings** — tuples `polar` (task 2) and `relative` (task 3), plus the
  direction symbols and the `>cartesian`/`flip` generics, are scattered across
  tasks (comment-only stub).
  *Fix:* bundle all tuple/symbol/generic definitions into task 1.
- **boatswains-bilge** — task 5's `valve` tuple, `<valve>` constructor, and
  `is-open` slot are not declared; the tests reference `<valve>`/`is-open>>`, so
  tasks 1–4 cannot compile. (Tasks 1–4 themselves use a `test-pump` fixture
  defined inside the test file and are otherwise fine.)
  *Fix:* pre-ship the valve skeleton in the stub —
  `TUPLE: valve < disposable is-open ;`, a stubbed `<valve>`, and `M: valve
  dispose* drop ;` — so the file compiles; task 5 fills in the bodies.

## Mode B — an early task's test called a later task's word (fixed)

Each was a test-design issue: the test for an early task observed its result
through a word the student had not been asked to write yet. All five were fixed
with test-only changes — moving the forward-referencing assertion into the task
that owns the word, or (for opaque structures) observing through a library word.

- **tellers-triage** — task 1 `[ new-queue serve-all ]` needed `serve-all`
  (task 4) and task 2 also used `serve-all`/`next-name`. Tasks 1–2 now observe
  the min-heap through library `heap-empty?` / `heap-size` / `heap-peek`.
- **lighthouse-logbook** — a task-1 freshness test `[ empty-log dup "x" sight ]`
  needed `sight` (task 2); moved to task 2.
- **garden-gathering** — a task-2 test used `release` (task 3) to check that ids
  keep increasing; moved to task 3.
- **poetry-club** — task 1 used `circle-of` (task 3) and task 2 used
  `same-circle?` (task 4); a disjoint-set is only observable through those, so
  tasks 1–2 now observe circles through library `equiv?`.
- **quayside-crew** — a task-3 test `[ <crane> 5 over hoist-crate tonnage>> ... ]`
  used `hoist-crate` (task 4) to show cranes are independent; moved to task 4.

## Structural

- **telegraphers-tape** — the tests use descriptive `print` labels, not `TASK:`
  markers, and each test is end-to-end (construct + read + dispose together), so
  no prefix of tasks passes on its own.
  *Fix (larger):* regroup the tests under per-task `TASK:` markers, ordered so
  each task's tests need only words from that task and earlier; or accept it as a
  documented exemption.

## Suggested track-wide rules (to keep new exercises Accretive)

1. The stub must make the test file compile on its own — pre-declare every
   tuple (with all slots), constant, symbol, error class, and word the tests
   reference (words as `"unimplemented" throw ;`). This makes Mode A impossible
   and is checkable with no per-exercise metadata.
2. Each task's tests must exercise only words from that task and earlier tasks
   (no Mode B).
3. Every exemplar should import `kernel` (so a re-stubbed body's `throw`
   resolves; also assumed by `bin/check-accretive`).

`bin/check-accretive` enforces (1) and (2) and can run in CI.
