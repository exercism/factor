# Instructions

You run the games of chance at the seaside boardwalk arcade. Punters
roll dice, the claw machine grabs a prize, and the card table needs its
deck shuffled and hands dealt — all powered by randomness. At the end of
the night you also want a "replay" feature so a disputed game can be run
again from the same seed.

## 1. Roll a die

Define `roll-die` to take the number of sides and return a roll in the
range `1` to `sides` (inclusive).

```factor
6 roll-die .
! => 4   (some value from 1..6)
```

## 2. Grab a prize

Define `pick-prize` to take a sequence of prizes and return one of them
at random.

```factor
{ "teddy" "goldfish" "keyring" } pick-prize .
! => "goldfish"
```

## 3. Shuffle the deck

Define `shuffle-deck` to take a deck (a sequence) and return it with the cards
in a random order.

```factor
{ 1 2 3 4 5 } shuffle-deck .
! => { 3 1 5 2 4 }
```

## 4. Deal a hand

Define `deal-hand` to take a deck and a count `n`, and return `n` *distinct*
cards from the deck.

```factor
{ 10 20 30 40 50 } 3 deal-hand .
! => { 40 10 30 }
```

## 5. Replay from a seed

Define `play-seeded` to take a seed and a quotation, and run the
quotation with a generator seeded from that integer, so the same seed
always reproduces the same outcome. The quotation's result should be
returned to the caller.

```factor
42 [ 6 roll-die ] play-seeded .
! => the same value every time for seed 42

! Same seed, same game:
99 [ 5 deal-hand ] play-seeded   99 [ 5 deal-hand ] play-seeded   =  .
! => t
```
