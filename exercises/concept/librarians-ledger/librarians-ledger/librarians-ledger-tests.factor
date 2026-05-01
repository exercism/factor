USING: exercism-tools librarians-ledger tools.test ;
IN: librarians-ledger.tests

TASK: 1 protected-balance
{ 30 }  [ 100 { 50 -200 30 } protected-balance ] unit-test

STOP-HERE

{ 50 }  [ 500 { 100 -300 -250 } protected-balance ] unit-test
{ 50 }  [ 0 { -10 50 } protected-balance ] unit-test
{ 100 } [ 100 { } protected-balance ] unit-test
{ 0 }   [ 0 { -100 -50 } protected-balance ] unit-test

TASK: 2 running-balance
{ { 50 20 0 100 } } [ { 50 -30 -20 100 } running-balance ] unit-test
{ { } }             [ { } running-balance ] unit-test
{ { 7 } }           [ { 7 } running-balance ] unit-test

TASK: 3 least-balance-so-far
{ { 50 20 0 0 } }       [ { 50 -30 -20 100 } least-balance-so-far ] unit-test
{ { 200 150 50 -150 } } [ { 200 -50 -100 -200 } least-balance-so-far ] unit-test
{ { } }                 [ { } least-balance-so-far ] unit-test
{ { 7 } }               [ { 7 } least-balance-so-far ] unit-test

TASK: 4 halve-until
{ { 50 25 12 6 3 } } [ 100 5 halve-until ] unit-test
{ { 32 16 8 4 2 1 } } [ 64 1 halve-until ] unit-test
{ { } } [ 3 5 halve-until ] unit-test
{ { 5 } } [ 10 5 halve-until ] unit-test
{ { } } [ 5 5 halve-until ] unit-test
