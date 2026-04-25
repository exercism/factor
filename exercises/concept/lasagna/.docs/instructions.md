# Instructions

In this exercise you're going to write some code to help you cook a
brilliant lasagna from your favorite cooking book.

You have four tasks, all related to the time spent cooking the lasagna.

## 1. Store the expected bake time in a constant

Define the `expected-bake-time` constant, which should return how many
minutes the lasagna needs to bake in the oven.

According to the cooking book, lasagna needs to be in the oven for a
total of 40 minutes.

```factor
expected-bake-time .
! => 40
```

## 2. Calculate the preparation time in minutes

Define the `preparation-time` word. It takes the number of layers you
added to the lasagna off the stack and leaves behind how many minutes
you spent preparing it, assuming each layer takes 2 minutes to prepare.

```factor
4 preparation-time .
! => 8
```

## 3. Calculate the remaining oven time in minutes

Define the `remaining-time` word. It takes the number of minutes the
lasagna has already spent in the oven and leaves behind how many
minutes it still has to remain in there.

```factor
25 remaining-time .
! => 15
```

## 4. Calculate the total working time in minutes

Define the `total-working-time` word. It takes two arguments off the
stack — first the number of layers in the lasagna, then the number of
minutes the lasagna has already been in the oven — and leaves behind
the total time spent cooking so far: the preparation time plus the
time already in the oven.

```factor
3 20 total-working-time .
! => 26
```
