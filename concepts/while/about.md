# About

`while` and `until` (in [`kernel`][kernel]) are quotation-driven
loop combinators for the case where you don't know the iteration
count in advance:

```
while ( pred: ( -- ? ) body: ( -- ) -- )
until ( pred: ( -- ? ) body: ( -- ) -- )
```

`while` keeps going as long as `pred` leaves a truthy value;
`until` keeps going as long as `pred` leaves `f`. Both stop and
return when their predicate flips.

```factor
USING: kernel math ;

! Halve down to 1
16 [ dup 1 > ] [ 2 / ] while .   ! => 1

! Double up to 100
1 [ dup 100 >= ] [ 2 * ] until .   ! => 128
```

When a single value flowing on the stack isn't enough state — say
a remaining list, a running total, and a counter all at once —
the cleanest pattern is to use named *locals* for clarity. Locals
are introduced more thoroughly later in the curriculum; here it
is enough to know that `:: word ( a b -- c )` declares the inputs
as named locals, and `:> name!` adds a mutable local that the
body can update with `value name!`.

```factor
USING: kernel locals math sequences ;

! Sum a sequence by hand
:: sum-by-hand ( seq -- total )
    seq :> rest!
    0 :> running!
    [ rest length 0 > ] [
        rest unclip [ rest! ] dip
        running + running!
    ] while
    running ;
```

[kernel]: https://docs.factorcode.org/content/vocab-kernel.html
