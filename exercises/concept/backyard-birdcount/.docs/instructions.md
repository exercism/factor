# Instructions

You're keeping daily counts of how many birds visit your garden. The
data is stored as an array of integers, with **today's count first**.

## 1. Today's count

Define `today` to take an array of daily counts off the stack and
return today's count, or `f` if the array is empty.

```factor
{ 2 5 1 } today .
! => 2

{ } today .
! => f
```

## 2. Increment today's count

Define `increment-day-count` to return a new array with today's
count increased by one. If the input is empty, return `{ 1 }`.

```factor
{ 4 0 2 } increment-day-count .
! => { 5 0 2 }

{ } increment-day-count .
! => { 1 }
```

## 3. Was there a day with no birds?

Define `has-day-without-birds?` to return `t` if at least one day
recorded zero birds, otherwise `f`.

**Use recursion** rather than `any?` or other higher-order sequence
words.

```factor
{ 2 0 4 } has-day-without-birds? .   ! => t
{ 3 8 1 5 } has-day-without-birds? . ! => f
```

## 4. Total birds since you started

Define `total` to return the sum of every count.

**Use recursion** rather than `sum`.

```factor
{ 4 0 9 0 5 } total .
! => 18
```

## 5. Busy days

A busy day is one with five or more birds. Define `busy-days` to
return the number of busy days.

**Use recursion** rather than `count`.

```factor
{ 4 5 0 0 6 } busy-days .
! => 2
```
