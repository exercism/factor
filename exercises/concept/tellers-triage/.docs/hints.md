# Hints

## General

- `<min-heap>`, `heap-push`, `heap-peek`, and `heap-pop-all` all live
  in [`heaps`][heaps]; `values` is in [`assocs`][assocs].
- A heap stores each item as a *value* with a *key*; the key is the
  priority. `heap-push` takes them as `( value key heap -- )`.

## 1. Open the queue

- `<min-heap>` builds an empty min-heap — the smallest key is served
  first.

## 2. Add a customer

- The customer name is the value and the priority is the key, which is
  exactly the order `heap-push` wants.
- `heap-push` consumes the queue. Use `[ heap-push ] keep` to add the
  customer and still return the queue.

## 3. Who's next?

- `heap-peek` returns `value key` for the front item without removing
  it. You only want the name, so `drop` the key.

## 4. Serve everyone

- `heap-pop-all` empties the heap into an association list of
  `{ key value }` pairs, already in priority order.
- `values` keeps just the values — the names.

[heaps]: https://docs.factorcode.org/content/vocab-heaps.html
[assocs]: https://docs.factorcode.org/content/vocab-assocs.html
