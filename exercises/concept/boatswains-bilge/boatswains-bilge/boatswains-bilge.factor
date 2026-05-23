USING: destructors kernel ;
IN: boatswains-bilge

: drain-bilge ( pump -- )
    "unimplemented" throw ;

: pump-out ( pump quot -- )
    "unimplemented" throw ;

: shift-routine ( pump-a pump-b quot -- )
    "unimplemented" throw ;

: risky-pump-out ( pump quot -- )
    "unimplemented" throw ;

! Task 5: define `valve` as a custom disposable, `<valve>` as its
! constructor, and an `M: valve dispose*` method.
