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

- For `metered-input`: `stream-read1`, `stream-read-unsafe`,
  `stream-element-type` (delegate), and `dispose*`.
- For `metered-output`: `stream-write1`, `stream-write`,
  `stream-flush` (delegate), and `dispose*`.

Each successful read or write should add the transferred byte
count to `bytes>>` and increment `ops>>` by one. A read that hits
end-of-file still counts as an op but transfers zero bytes.
`dispose*` should pass through to the underlying stream.
