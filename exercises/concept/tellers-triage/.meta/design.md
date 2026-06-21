# Design

## Goal

Introduce Factor's `heaps` vocabulary as a priority queue: building a
min-heap, pushing keyed values, peeking the front, and draining in
priority order.

## Learning objectives

- Build a priority queue with `<min-heap>`.
- Add an item as a value keyed by a priority with `heap-push`, which
  mutates the heap in place.
- Read the front item without removing it using `heap-peek`.
- Drain the whole heap in priority order with `heap-pop-all`, and pull
  out the values with `values`.
- Recognise `heap-pop` (remove the front item) and `heap-empty?` (is
  the heap drained?) as the building blocks of serving items one at a
  time. These are taught in the introduction but not exercised by a
  task.

## Out of scope

- `<max-heap>`, `heap-delete`, and `heap-size`.
- Changing an item's priority after it is pushed; custom comparisons.
- The internal binary-heap array representation.

## Concepts

- `heaps`.

## Prerequisites

- `combinators` — `keep` to thread the queue back onto the stack.
- `assocs` — `values` to read the names out of the popped alist.
- `sequences` — `serve-all` returns a sequence of names.
