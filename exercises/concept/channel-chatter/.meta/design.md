# Design

## Goal

Teach the *consumption* side of Factor's stream protocol — how
callers acquire, read from, write to, and scope bundled streams
— ahead of `telegraphers-tape`, which teaches the
*implementation* side. By the time the student writes their own
stream protocol they have already *been* a stream caller.

## Learning objectives

- Distinguish explicit-stream words (`stream-read`,
  `stream-write`, `stream-contents`, `stream-lines`) from
  ambient-stream words (`read`, `write`, `print`, `readln`).
- Use `<string-reader>` and `<string-writer>` as in-memory
  streams for testable I/O.
- Use `stream-flush` to push buffered output through.
- Use `with-string-writer` to capture a quotation's ambient
  output as a string.
- Recognise the `with-…` family (`with-input-stream`,
  `with-output-stream`, `with-file-reader`, `with-file-writer`)
  as the destructor combinators from `boatswains-bilge`
  specialised to streams.

## Out of scope

- Implementing the stream protocol — that's `telegraphers-tape`.
- Encoding negotiation (`utf8`, `ascii`, etc.) beyond a passing
  mention in the intro.
- Network streams (sockets, HTTP) — same protocol, different
  exercise if needed.
- `stream-read-unsafe` and other low-level batch read primitives.

## Concepts

- `io-streams`: ambient vs explicit stream words, the
  `<string-reader>` / `<string-writer>` family, and the
  scoped `with-…` combinators.

## Prerequisites

- `destructors` — taught in `boatswains-bilge`. All the
  `with-…` stream combinators are destructor scopes; the
  cleanup guarantee comes from there.
- `sequences` — taught in `backyard-birdwatcher`. `stream-lines`
  returns an array; `last`/`length` consume it.
- `strings` — taught in `log-levels`. `>upper` (used in task 3)
  and string handling generally.

## Tasks ramp

1. **`hear-out`** — single-word answer (`stream-contents`).
   Drains an entire reader.
2. **`count-messages`** — `stream-lines length`. Switches to
   line-oriented reading and combines two words.
3. **`echo-back`** — `stream-lines last >upper`. Adds string
   transformation; the student picks a particular line out of
   the array form.
4. **`broadcast`** — `stream-write` followed by `stream-flush`,
   using `::` locals to refer to the writer twice. First time
   touching the *write* side.
5. **`capture`** — `with-string-writer ; inline`. The
   pedagogical payoff: a quotation that uses ambient `print` /
   `write` can be captured into a string just by wrapping it.
   This is the exact shape `telegraphers-tape` then assumes
   when testing custom streams.

## Why all-string-streams

File I/O in unit tests is fiddly across platforms (paths,
permissions, cleanup). Confining tasks to `<string-reader>` /
`<string-writer>` keeps tests fully deterministic while still
exercising the real protocol — `<file-reader>` and
`<file-writer>` implement the same interface, so the lessons
transfer directly. The introduction explicitly names the file
variants so students see the generalisation.

## Why before `telegraphers-tape`

Before this exercise existed, telegraphers-tape carried the
entire stream story in one introduction: what streams are, how
to use them, *and* how to implement one. Splitting "use" off
into channel-chatter halves the intro and lets each exercise
teach one clean lesson. It also gives `destructors` an immediate
concrete payoff: file handles and string-writers are exactly
the kind of disposable the framework was built for.
