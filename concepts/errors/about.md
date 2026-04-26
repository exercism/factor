# About

Any value can be an error. `throw` (in `kernel`) signals; the
current word's stack effect is abandoned and control unwinds to
the nearest enclosing `recover`.

```factor
[ 0 1 / ] [ "div by zero" prepend ] recover
```

`ERROR:` is a parsing word that defines an error tuple class *and*
a constructor word in one go:

```factor
ERROR: not-found path ;
! defines:
!   TUPLE: not-found path ;
!   : not-found ( path -- * ) \ not-found boa throw ;
!   : not-found? ( object -- ? ) … class predicate
```

That gives every custom error a unique class, a friendly throwing
constructor, and a class predicate to test caught errors against:

```factor
[ "/missing" not-found ]
[ dup not-found? [ path>> "missing: " prepend ] [ drop "other" ] if ]
recover
```

For finally-style cleanup, see `cleanup` in `continuations`. For
restartable conditions, see `condition`.
