# Instructions

You're an avid bird watcher who keeps a daily count of the birds
visiting your garden. The counts are stored in an array, oldest day
first.

## 1. Today's count

Define `today` to take the array of daily counts off the stack and
return the count for today.

```factor
{ 2 5 0 7 4 1 } today .
! => 1
```

## 2. Increment today's count

Define `increment-todays-count` to return a new array with today's
count increased by one. The original array should not be modified.

```factor
{ 2 5 0 7 4 1 } increment-todays-count .
! => { 2 5 0 7 4 2 }
```

## 3. Was there a day with no birds?

Define `has-day-without-birds?` to return `t` if at least one day
recorded zero birds, otherwise `f`.

```factor
{ 2 5 0 7 4 1 } has-day-without-birds? .
! => t

{ 2 5 1 } has-day-without-birds? .
! => f
```

## 4. Sum the first few days

Define `count-for-first-days` to take an array of counts and a number
`n`, and return the sum of the first `n` counts.

```factor
{ 2 5 0 7 4 1 } 4 count-for-first-days .
! => 14
```

## 5. Count the busy days

A busy day is one with five or more birds. Define `busy-days` to
return the number of busy days in the array.

```factor
{ 2 5 0 7 4 1 } busy-days .
! => 2
```
