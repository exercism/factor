USING: binary-search-tree exercism-tools io kernel tools.test unicode ;
IN: binary-search-tree.tests

"data is retained" description
{ T{ branch f "4" T{ leaf } T{ leaf } } }
[ { "4" } <bst> ] unit-test

STOP-HERE

"smaller number at left node" description
{ T{ branch f "4" T{ branch f "2" T{ leaf } T{ leaf } } T{ leaf } } }
[ { "4" "2" } <bst> ] unit-test

"same number at left node" description
{ T{ branch f "4" T{ branch f "4" T{ leaf } T{ leaf } } T{ leaf } } }
[ { "4" "4" } <bst> ] unit-test

"greater number at right node" description
{ T{ branch f "4" T{ leaf } T{ branch f "5" T{ leaf } T{ leaf } } } }
[ { "4" "5" } <bst> ] unit-test

"can create complex tree" description
{ T{ branch f "4" T{ branch f "2" T{ branch f "1" T{ leaf } T{ leaf } } T{ branch f "3" T{ leaf } T{ leaf } } } T{ branch f "6" T{ branch f "5" T{ leaf } T{ leaf } } T{ branch f "7" T{ leaf } T{ leaf } } } } }
[ { "4" "2" "6" "1" "3" "5" "7" } <bst> ] unit-test

"can sort single number" description
{ { "2" } }
[ { "2" } <bst> sorted-data ] unit-test

"can sort if second number is smaller than first" description
{ { "1" "2" } }
[ { "2" "1" } <bst> sorted-data ] unit-test

"can sort if second number is same as first" description
{ { "2" "2" } }
[ { "2" "2" } <bst> sorted-data ] unit-test

"can sort if second number is greater than first" description
{ { "2" "3" } }
[ { "2" "3" } <bst> sorted-data ] unit-test

"can sort complex tree" description
{ { "1" "2" "3" "5" "6" "7" } }
[ { "2" "1" "3" "6" "7" "5" } <bst> sorted-data ] unit-test

"empty input yields a leaf" description
{ T{ leaf } }
[ { } <bst> ] unit-test

"can sort empty input" description
{ { } }
[ { } <bst> sorted-data ] unit-test
