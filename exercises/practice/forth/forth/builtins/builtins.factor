USING: kernel ;
IN: forth.builtins

! Implement the primitive Forth operations as words that take
! the current stack (an array of integers) and return the new
! stack. Throw an error class for the canonical error cases:
!
!   "empty stack"               -- stack is empty
!   "only one value on the stack"
!   "divide by zero"
!
! Required primitives: forth+, forth-, forth*, forth/, forth-dup,
! forth-drop, forth-swap, forth-over.

: forth+ ( s -- s' ) "unimplemented" throw ;
