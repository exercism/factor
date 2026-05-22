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

`map-sum` (also in `sequences`) maps a quotation across the
sequence and adds the results in one pass. The same pattern
drives `sort-by` (in [`sorting`][sorting]) and `minimum-by` /
`maximum-by` (in `sequences`).

[sorting]: https://docs.factorcode.org/content/vocab-sorting.html
