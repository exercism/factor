USING: exercism-tools io kernel list-ops math tools.test unicode ;
IN: list-ops.tests

"empty lists" description
{ {  } }
[ {  } {  } list-append ] unit-test

STOP-HERE

"list to empty list" description
{ { 1 2 3 4 } }
[ {  } { 1 2 3 4 } list-append ] unit-test

"empty list to list" description
{ { 1 2 3 4 } }
[ { 1 2 3 4 } {  } list-append ] unit-test

"non-empty lists" description
{ { 1 2 2 3 4 5 } }
[ { 1 2 } { 2 3 4 5 } list-append ] unit-test

"empty list" description
{ {  } }
[ {  } list-concat ] unit-test

"list of lists" description
{ { 1 2 3 4 5 6 } }
[ { { 1 2 } { 3 } {  } { 4 5 6 } } list-concat ] unit-test

"list of nested lists" description
{ { { 1 } { 2 } { 3 } {  } { 4 5 6 } } }
[ { { { 1 } { 2 } } { { 3 } } { {  } } { { 4 5 6 } } } list-concat ] unit-test

"empty list" description
{ {  } }
[ {  } [ odd? ] select ] unit-test

"non-empty list" description
{ { 1 3 5 } }
[ { 1 2 3 5 } [ odd? ] select ] unit-test

"empty list" description
{ 0 }
[ {  } list-length ] unit-test

"non-empty list" description
{ 4 }
[ { 1 2 3 4 } list-length ] unit-test

"empty list" description
{ {  } }
[ {  } [ 1 + ] collect ] unit-test

"non-empty list" description
{ { 2 4 6 8 } }
[ { 1 3 5 7 } [ 1 + ] collect ] unit-test

"empty list" description
{ 2 }
[ {  } 2 [ * ] foldl ] unit-test

"direction independent function applied to non-empty list" description
{ 15 }
[ { 1 2 3 4 } 5 [ + ] foldl ] unit-test

"direction dependent function applied to non-empty list" description
{ 64 }
[ { 1 2 3 4 } 24 [ swap / ] foldl ] unit-test

"empty list" description
{ 2 }
[ {  } 2 [ * ] foldr ] unit-test

"direction independent function applied to non-empty list" description
{ 15 }
[ { 1 2 3 4 } 5 [ + ] foldr ] unit-test

"direction dependent function applied to non-empty list" description
{ 9 }
[ { 1 2 3 4 } 24 [ swap / ] foldr ] unit-test

"empty list" description
{ {  } }
[ {  } list-reverse ] unit-test

"non-empty list" description
{ { 7 5 3 1 } }
[ { 1 3 5 7 } list-reverse ] unit-test

"list of lists is not flattened" description
{ { { 4 5 6 } {  } { 3 } { 1 2 } } }
[ { { 1 2 } { 3 } {  } { 4 5 6 } } list-reverse ] unit-test
