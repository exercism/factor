# Instructions append

## Words

- `<bst> ( data-seq -- tree )` — build a tree by inserting each
  element of `data-seq` in order.
- `sorted-data ( tree -- seq )` — return the tree's elements in
  ascending order (in-order traversal).

## Tuple hierarchy

A node in a binary search tree is either *empty* or *has data
plus two subtrees*. Model that as a small inheritance hierarchy:

```factor
TUPLE: bst ;
TUPLE: leaf < bst ;
TUPLE: branch < bst data left right ;
```

`bst` is the abstract parent; `leaf` is the empty-tree case;
`branch` carries a value and two `bst` children (each itself
either a `leaf` or a `branch`).

## Ordering

Compare data with `before=?` (from `math.order`), which works
on strings as well as numbers — the tests use string data like
`"1"`, `"2"`, `"3"`.
