# Instructions append

## Words

Define two wrapper tuples that extend `disposable` (from
`destructors`) and store the underlying stream alongside `bytes`
and `ops` integer counters:

- `metered-input < disposable` with slots `stream`, `bytes`, `ops`.
- `metered-output < disposable` with slots `stream`, `bytes`, `ops`.

Construct each with `new-disposable` (rather than `new`) so the
wrapper is registered with the destructor framework.

- `<metered-input> ( stream -- m )` — wrap an input stream.
- `<metered-output> ( stream -- m )` — wrap an output stream.

Declare each tuple an instance of the appropriate stream mixin:

```
INSTANCE: metered-input  input-stream
INSTANCE: metered-output output-stream
```

Then provide `M:` methods that delegate to the underlying stream
while updating the counters:

- For `metered-input`: [`stream-read1`][stream-read1],
  [`stream-read-unsafe`][stream-read-unsafe],
  [`stream-element-type`][stream-element-type] (delegate), and
  [`dispose*`][dispose*].
- For `metered-output`: [`stream-write1`][stream-write1],
  [`stream-write`][stream-write], [`stream-flush`][stream-flush]
  (delegate), and [`dispose*`][dispose*].

Each successful read or write should add the transferred byte
count to `bytes>>` and increment `ops>>` by one. A read that hits
end-of-file still counts as an op but transfers zero bytes.
`dispose*` should pass through to the underlying stream.

[stream-read1]: https://docs.factorcode.org/content/word-stream-read1,io.html
[stream-read-unsafe]: https://docs.factorcode.org/content/word-stream-read-unsafe,io.html
[stream-element-type]: https://docs.factorcode.org/content/word-stream-element-type,io.html
[dispose*]: https://docs.factorcode.org/content/word-dispose__star__,destructors.html
[stream-write1]: https://docs.factorcode.org/content/word-stream-write1,io.html
[stream-write]: https://docs.factorcode.org/content/word-stream-write,io.html
[stream-flush]: https://docs.factorcode.org/content/word-stream-flush,io.html
