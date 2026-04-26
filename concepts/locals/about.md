# About

Locals don't replace stack code — they live alongside it. Reach
for them when:

- The same input is referenced more than once.
- The natural order of operations doesn't match stack order.
- You're inside a higher-order word that hands the lambda several
  values at once (`assoc-map`'s `( key value -- newkey newvalue )`).

```factor
USING: locals ;

! Two references to ratio: stack-shuffled vs. local.
: average  ( a b -- avg ) + 2 / ;
:: average ( a b -- avg ) a b + 2 / ;        ! same effect
```

`[let | binding-list | body ]` introduces local bindings inside a
quotation:

```factor
[let | x [ 5 ] y [ 10 ] | x y + ] .   ! => 15
```

The `:>` mutation suffix lets you rebind a local — useful in
imperative-feeling loops:

```factor
:: collatz ( n -- count )
    n :> current!
    0 :> count!
    [ current 1 = ] [
        current odd?
        [ current 3 * 1 + current! ]
        [ current 2 / current! ] if
        count 1 + count!
    ] until
    count ;
```
