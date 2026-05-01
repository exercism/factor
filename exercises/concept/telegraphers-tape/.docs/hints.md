# Hints

## General

- `disposable` is in `destructors`; the stream protocol generics
  are in `io`; `<string-reader>` (used by the tests) is in
  `io.streams.string`.
- A `TUPLE: x < y ...` declaration makes `x` inherit `y`'s
  slots. `disposable` adds a `disposed` flag and registers the
  tuple with the destructor framework when constructed via
  `new-disposable`.

## 1. Define the tape

- The constructor: `tape new-disposable swap >>wire ;`. The
  `swap` is so the wire ends up below the freshly-built tape
  for `>>wire` to consume.

## 2. Join the input-stream mixin

- One line at the top level, after the `TUPLE:` declaration.

## 3. Read one Morse symbol

- The simplest shape is a small loop: read a byte, check it,
  return it if it's a Morse symbol or `f`, otherwise read the
  next.
- A character literal is written `CHAR: .`. Space is `CHAR: \s`.
- `member?` on a small array works:
  `B{ CHAR: . CHAR: - CHAR: \s } member?`.
- The simplest control structure: a `while` loop that reads
  until it gets a Morse symbol or `f`, paired with a final
  `dup` to hand the result to the caller.

## 4. Delegate the element type

- A one-line method: `wire>> stream-element-type`.

## 5. Clean up

- Same shape: `wire>> dispose`.
- Don't call `dispose*` yourself — call `dispose` on the wire.
  The framework's job is making sure your `dispose*` only runs
  once.
