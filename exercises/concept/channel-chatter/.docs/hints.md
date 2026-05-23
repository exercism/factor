# Hints

## General

- The reading words live in [`io`][io]; the string-stream
  constructors and `with-string-writer` live in
  [`io.streams.string`][io.streams.string].
- For the writer-flushing task, locals (`::` and `:>`) keep the
  body readable when you need to touch the same stream twice.

## 1. Hear it all out

- One word: `stream-contents`.

## 2. Count the messages

- `stream-lines` splits the stream into an array of lines;
  `length` returns the count.

## 3. Echo back the last call

- Same `stream-lines` as above, then `last`, then `>upper` (from
  `ascii`).

## 4. Broadcast a message

- `stream-write` writes the message, `stream-flush` pushes it
  out. The writer is used twice, so reach for `::` locals:
  `:: broadcast ( message writer -- ) message writer stream-write
  writer stream-flush ;`.

## 5. Capture a quotation's output

- One word: `with-string-writer`. Add `inline` after the closing
  `;` so the compiler can see through the quotation argument:
  `: capture ( quot -- captured ) with-string-writer ; inline`.

[io]: https://docs.factorcode.org/content/vocab-io.html
[io.streams.string]: https://docs.factorcode.org/content/vocab-io.streams.string.html
