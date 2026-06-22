USING: kernel ;
IN: bering-bearings

! Task 1: define the data model and the two generic words here:
!   - tuple cardinal (slot: direction); tuple polar (magnitude bearing);
!     tuple relative (distance bearing)
!   - SYMBOLS: north east south west  ahead starboard behind port
!   - SYMBOL: heading
!   - GENERIC: >cartesian ( direction -- x y )
!   - GENERIC: flip ( direction -- direction' )
!   - the M: cardinal method of >cartesian
! The polar/relative >cartesian methods (tasks 2-3) and the flip
! methods (task 4) are added later.

: add-bearings ( a b -- x y )
    "unimplemented" throw ;
