# Instructions

You are a deckhand re-stowing cargo crates on the quay. Each task is a
single word whose body uses only shuffle words — no arithmetic.

## 1. Swap the top two crates

Define the `swap-crates` word. It takes two crates off the stack and
leaves them behind in the opposite order.

```factor
1 2 swap-crates .s
! 2
! 1
```

## 2. Clear the spilled crate

Define the `clear-spill` word. It takes three crates off the stack and
leaves the bottom two behind, discarding the top one.

```factor
1 2 3 clear-spill .s
! 1
! 2
```

## 3. Keep a copy of the crate underneath

Define the `peek-under` word. It takes two crates off the stack and
leaves them behind with a copy of the lower crate placed on top.

```factor
1 2 peek-under .s
! 1
! 2
! 1
```

## 4. Tidy the deck

Define the `tidy-deck` word. It takes three crates off the stack — in
the order `x y z` — and leaves behind `z z y`: discard the bottom
crate, then leave two copies of the top crate sitting under the middle
one.

```factor
1 2 3 tidy-deck .s
! 3
! 3
! 2
```
