# Hints

## General

- `H{ } clone` is the right way to start a fresh, mutable hashtable
  — `H{ }` literals can be shared between calls.
- `inc-at` from [`assocs`][assocs] adds 1 to a key's value (or
  inserts it as 1 if absent).

## 1. Build an inventory from a list

- Start with `H{ } clone` and `inc-at` for each element. A fry
  quotation `'[ _ inc-at ]` captures the hashtable so you can pass it
  through `each`.
- Wrap the iteration in `[ … ] keep` so the hashtable is the value
  left on the stack.

## 2. Add more items

- The shape is the same as task 1 except you start from a `clone` of
  the input inventory rather than an empty one.

## 3. Decrement counts

- Use `key?` first; only items already in the inventory get touched.
- `change-at` accepts a quotation `( old -- new )`; pair it with
  `[ 1 - 0 max ]` (with `max` from [`math.order`][math.order]) so
  the count never goes negative.

## 4. Remove an item entirely

- `delete-at` mutates the hashtable and returns nothing — `clone`
  first, then `delete-at`, then leave the clone on the stack.

## 5. List the available items

- `>alist` converts the hashtable to a sequence of pairs.
- `[ second 0 > ] filter` keeps only the in-stock items.
- `sort-keys` (in [`sorting`][sorting]) sorts an alist by key.

[assocs]: https://docs.factorcode.org/content/vocab-assocs.html
[math.order]: https://docs.factorcode.org/content/vocab-math.order.html
[sorting]: https://docs.factorcode.org/content/vocab-sorting.html
