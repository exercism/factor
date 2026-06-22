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

! Task 5: the valve tuple is declared for you. Implement <valve>
! (construct a fresh open valve) and M: valve dispose* (mark it closed).
TUPLE: valve < disposable is-open ;

: <valve> ( -- valve )
    "unimplemented" throw ;

M: valve dispose*
    "unimplemented" throw ;
