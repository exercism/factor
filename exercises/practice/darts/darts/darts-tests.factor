USING: darts io kernel lexer tools.test unicode ;
IN: darts.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Darts:" print

"Missed target" print
{ 0 } [ -9.0 9.0 score ] unit-test

STOP-HERE

"On the outer circle" print
{ 1 } [ 0.0 10.0 score ] unit-test

"On the middle circle" print
{ 5 } [ -5.0 0.0 score ] unit-test

"On the inner circle" print
{ 10 } [ 0.0 -1.0 score ] unit-test

"Exactly on center" print
{ 10 } [ 0.0 0.0 score ] unit-test

"Near the center" print
{ 10 } [ -0.1 -0.1 score ] unit-test

"Just within the inner circle" print
{ 10 } [ 0.7 0.7 score ] unit-test

"Just outside the inner circle" print
{ 5 } [ 0.8 -0.8 score ] unit-test

"Just within the middle circle" print
{ 5 } [ -3.5 3.5 score ] unit-test

"Just outside the middle circle" print
{ 1 } [ -3.6 -3.6 score ] unit-test

"Just within the outer circle" print
{ 1 } [ -7.0 7.0 score ] unit-test

"Just outside the outer circle" print
{ 0 } [ 7.1 -7.1 score ] unit-test

"Asymmetric position between the inner and middle circles" print
{ 5 } [ 0.5 -4.0 score ] unit-test
