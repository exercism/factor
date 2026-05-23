USING: exercism-tools kernel math sequences signal-stencils
       tools.test ;
IN: signal-stencils.tests

! Wrappers exercise the macros; tests exercise the wrappers.
! A macro can only be observed through the runtime behaviour of
! code it generates, so the test file builds small consumers.

: inc-twice ( x -- y ) [ 1 + ] twice ;
: dec-twice ( x -- y ) [ 1 - ] twice ;
: stutter ( seq -- seq' ) [ reverse ] twice ;

TASK: 1 twice
{ 7 } [ 5 inc-twice ] unit-test

STOP-HERE

{ 3 } [ 5 dec-twice ] unit-test
! twice composes the quotation with itself — reverse twice is the identity
{ { 1 2 3 } } [ { 1 2 3 } stutter ] unit-test

: inc-thrice ( x -- y ) [ 1 + ] 3 repeat-quot ;
: dec-five  ( x -- y ) [ 1 - ] 5 repeat-quot ;
: identity-zero ( x -- x ) [ 1 + ] 0 repeat-quot ;

TASK: 2 repeat-quot
{ 8 }  [ 5  inc-thrice  ] unit-test
{ 0 }  [ 5  dec-five    ] unit-test
! N=0 generates an empty quotation — calling it is a no-op
{ 5 }  [ 5  identity-zero ] unit-test

: pipeline ( x -- y ) { [ 1 + ] [ 2 * ] [ 1 - ] } compose-many ;
: empty-pipeline ( x -- x ) { } compose-many ;

TASK: 3 compose-many
! (5 + 1) * 2 - 1 = 11
{ 11 } [ 5 empty-pipeline pipeline ] unit-test
! an empty array generates an empty quotation
{ 5 } [ 5 empty-pipeline ] unit-test

: sum-three ( -- n ) 0 { 10 20 30 } [ + ] each-literal ;
: sum-empty ( -- n ) 0 { } [ + ] each-literal ;
: double-and-sum ( -- n )
    0 { 1 2 3 4 } [ 2 * + ] each-literal ;

TASK: 4 each-literal
{ 60 } [ sum-three ] unit-test
! empty sequence generates no per-element code — just the seed
{ 0 } [ sum-empty ] unit-test
! 0 + 1*2 + 2*2 + 3*2 + 4*2 = 20
{ 20 } [ double-and-sum ] unit-test
