# Instructions append

## Words

`2-for-1 ( name -- str )` takes either a string name or `f` for
the no-name case.

```factor
"Alice" 2-for-1   ! "One for Alice, one for me."
f 2-for-1         ! "One for you, one for me."
```
