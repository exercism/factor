# Instructions append

## Words

Define a `linked-list` tuple and provide a `M: linked-list length`
method (from `sequences`) so the tests can call `length` directly
on your list.

- `<linked-list> ( -- linked-list )` — construct an empty list.
- `>linked-list ( seq -- linked-list )` — push each element of
  `seq` onto a fresh list, in order.
- `linked-list>array ( linked-list -- array )` — return the
  values, top of the list first.
- `list-push ( linked-list value -- linked-list )` — push a value
  on top.
- `list-pop ( linked-list -- linked-list value )` — remove and
  return the top value.
- `list-peek ( linked-list -- value )` — return the top value
  without removing it.
- `list-reverse ( linked-list -- linked-list )` — return a list
  with the elements in reverse order.

Throw a `list-empty` error class from `list-pop` and `list-peek`
when the list is empty.
