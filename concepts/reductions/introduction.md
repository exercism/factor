# Introduction

A *reduction* combines the elements of a sequence into a single
value (or a derived sequence of running values). Factor's
general-purpose reducer is `reduce`; `math.statistics` adds a
family of cumulative operations — running sums, products, mins,
and maxes — for when you want every intermediate result instead
of just the last one.

```factor
USING: math math.statistics sequences ;

{ 2 5 1 3 } 0 [ + ] reduce .         ! => 11

{ 2 5 1 3 } cum-sum .                ! => { 2 7 8 11 }
{ 2 5 1 3 } cum-product .            ! => { 2 10 10 30 }
{ 2 5 1 3 } cum-min .                ! => { 2 2 1 1 }
{ 2 5 1 3 } cum-max .                ! => { 2 5 5 5 }
```

[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
