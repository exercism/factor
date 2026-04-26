# Introduction

The most useful sequence words take a *quotation* as one of their
inputs and use it to drive the operation:

```
each   ( seq quot -- )
map    ( seq quot -- newseq )
filter ( seq quot -- newseq )
reject ( seq quot -- newseq )
count  ( seq quot -- n )
any?   ( seq quot -- ? )
all?   ( seq quot -- ? )
```

```factor
{ 1 2 3 4 5 } [ even? ] filter .   ! => { 2 4 }
{ 1 2 3 4 5 } [ sq ] map .         ! => { 1 4 9 16 25 }
{ 1 2 3 4 5 } [ 2 > ] count .      ! => 3
```

Sorting and aggregation use the same pattern via
[`sorting`][sorting] and [`math.statistics`][math.statistics]:
`sort-by`, `infimum-by`, `supremum-by`, `map-sum`.

[sorting]: https://docs.factorcode.org/content/vocab-sorting.html
[math.statistics]: https://docs.factorcode.org/content/vocab-math.statistics.html
