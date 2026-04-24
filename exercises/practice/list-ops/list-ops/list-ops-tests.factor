USING: io kernel lexer list-ops math tools.test unicode ;
IN: list-ops.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"List Ops:" print

"empty lists" print
{ {  } }
[ {  } {  } list-append ] unit-test

STOP-HERE

"list to empty list" print
{ { 1 2 3 4 } }
[ {  } { 1 2 3 4 } list-append ] unit-test

"empty list to list" print
{ { 1 2 3 4 } }
[ { 1 2 3 4 } {  } list-append ] unit-test

"non-empty lists" print
{ { 1 2 2 3 4 5 } }
[ { 1 2 } { 2 3 4 5 } list-append ] unit-test

"empty list" print
{ {  } }
[ {  } list-concat ] unit-test

"list of lists" print
{ { 1 2 3 4 5 6 } }
[ { { 1 2 } { 3 } {  } { 4 5 6 } } list-concat ] unit-test

"list of nested lists" print
{ { { 1 } { 2 } { 3 } {  } { 4 5 6 } } }
[ { { { 1 } { 2 } } { { 3 } } { {  } } { { 4 5 6 } } } list-concat ] unit-test

"empty list" print
{ {  } }
[ {  } [ odd? ] select ] unit-test

"non-empty list" print
{ { 1 3 5 } }
[ { 1 2 3 5 } [ odd? ] select ] unit-test

"empty list" print
{ 0 }
[ {  } list-length ] unit-test

"non-empty list" print
{ 4 }
[ { 1 2 3 4 } list-length ] unit-test

"empty list" print
{ {  } }
[ {  } [ 1 + ] collect ] unit-test

"non-empty list" print
{ { 2 4 6 8 } }
[ { 1 3 5 7 } [ 1 + ] collect ] unit-test

"empty list" print
{ 2 }
[ {  } 2 [ * ] foldl ] unit-test

"direction independent function applied to non-empty list" print
{ 15 }
[ { 1 2 3 4 } 5 [ + ] foldl ] unit-test

"direction dependent function applied to non-empty list" print
{ 64 }
[ { 1 2 3 4 } 24 [ swap / ] foldl ] unit-test

"empty list" print
{ 2 }
[ {  } 2 [ * ] foldr ] unit-test

"direction independent function applied to non-empty list" print
{ 15 }
[ { 1 2 3 4 } 5 [ + ] foldr ] unit-test

"direction dependent function applied to non-empty list" print
{ 9 }
[ { 1 2 3 4 } 24 [ swap / ] foldr ] unit-test

"empty list" print
{ {  } }
[ {  } list-reverse ] unit-test

"non-empty list" print
{ { 7 5 3 1 } }
[ { 1 3 5 7 } list-reverse ] unit-test

"list of lists is not flattened" print
{ { { 4 5 6 } {  } { 3 } { 1 2 } } }
[ { { 1 2 } { 3 } {  } { 4 5 6 } } list-reverse ] unit-test
