# Introduction

*Combinators* are higher-order words that capture common stack-
shuffling patterns in named form. Reaching for them means you write
much less `dup`, `swap`, `over`, `rot`.

```
keep   ( x quot: ( x -- y ) -- y x )         ! apply, preserve x
dip    ( x quot -- x )                        ! operate underneath
bi     ( x q1 q2 -- r1 r2 )                   ! two functions of one input
tri    ( x q1 q2 q3 -- r1 r2 r3 )             ! three functions of one input
cleave ( x { q1 q2 … } -- r1 r2 … )           ! n functions of one input
bi@    ( x y q -- r1 r2 )                     ! same function on two values
bi*    ( x y q1 q2 -- r1 r2 )                 ! different functions on two values
```

```factor
5 [ 2 * ] keep .s            ! 10  /  5
4 [ sq ] [ neg ] bi .s       ! 16  / -4
1 2 3 [ + ] dip .s           ! 3   /  3
3 4 [ sq ] bi@ .s            ! 9   / 16
```

`keep`, `dip`, `bi`, `bi@`, `bi*` are in [`kernel`][kernel];
`cleave` and the longer variants are in [`combinators`][combinators].

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
[combinators]: https://docs.factorcode.org/content/vocab-combinators.html
