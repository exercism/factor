USING: accessors arrays exercism-tools io kernel make math sequences simple-linked-list tools.test unicode ;
IN: simple-linked-list.tests

"Empty list has length of zero" description
{ { 0 } }
[ [ <linked-list> dup length , drop ] { } make ]
unit-test

STOP-HERE

"Singleton list has length of one" description
{ { 1 } }
[ [ { 1 } >linked-list dup length , drop ] { } make ]
unit-test

"Non-empty list has correct length" description
{ { 3 } }
[ [ { 1 2 3 } >linked-list dup length , drop ] { } make ]
unit-test

"Pop from empty list is an error" description
[ <linked-list> list-pop ] [ list-empty? ] must-fail-with

"Can pop from singleton list" description
{ { 1 } }
[ [ { 1 } >linked-list list-pop , drop ] { } make ]
unit-test

"Can pop from non-empty list" description
{ { 2 } }
[ [ { 1 2 } >linked-list list-pop , drop ] { } make ]
unit-test

"Can pop multiple items" description
{ { 2 1 } }
[ [ { 1 2 } >linked-list list-pop , list-pop , drop ] { } make ]
unit-test

"Pop updates the count" description
{ { 2 2 1 1 0 } }
[ [ { 1 2 } >linked-list dup length , list-pop , dup length , list-pop , dup length , drop ] { } make ]
unit-test

"Can push to an empty list" description
{ {  } }
[ [ <linked-list> 1 list-push drop ] { } make ]
unit-test

"Can push to a non-empty list" description
{ {  } }
[ [ { 1 2 } >linked-list 3 list-push drop ] { } make ]
unit-test

"Push updates count" description
{ { 3 } }
[ [ { 1 2 } >linked-list 3 list-push dup length , drop ] { } make ]
unit-test

"Push and pop" description
{ { 2 2 3 1 0 } }
[ [ <linked-list> 1 list-push 2 list-push list-pop , 3 list-push dup length , list-pop , list-pop , dup length , drop ] { } make ]
unit-test

"Peek on empty list is an error" description
[ <linked-list> list-peek ] [ list-empty? ] must-fail-with

"Can peek on singleton list" description
{ { 1 } }
[ [ { 1 } >linked-list dup list-peek , drop ] { } make ]
unit-test

"Can peek on non-empty list" description
{ { 2 } }
[ [ { 1 2 } >linked-list dup list-peek , drop ] { } make ]
unit-test

"Peek does not change the count" description
{ { 2 2 } }
[ [ { 1 2 } >linked-list dup list-peek , dup length , drop ] { } make ]
unit-test

"Can peek after a pop and push" description
{ { 2 2 1 3 } }
[ [ <linked-list> 1 list-push 2 list-push dup list-peek , list-pop , dup list-peek , 3 list-push dup list-peek , drop ] { } make ]
unit-test

"Empty linked list to list is empty" description
{ { {  } } }
[ [ <linked-list> dup linked-list>array , drop ] { } make ]
unit-test

"To list with multiple values" description
{ { { 3 2 1 } } }
[ [ { 1 2 3 } >linked-list dup linked-list>array , drop ] { } make ]
unit-test

"To list after a pop" description
{ { 3 { 4 2 1 } } }
[ [ <linked-list> 1 list-push 2 list-push 3 list-push list-pop , 4 list-push dup linked-list>array , drop ] { } make ]
unit-test

"Reversed empty list has same values" description
{ { {  } } }
[ [ <linked-list> list-reverse dup linked-list>array , drop ] { } make ]
unit-test

"Reversed singleton list is same list" description
{ { { 1 } } }
[ [ { 1 } >linked-list list-reverse dup linked-list>array , drop ] { } make ]
unit-test

"Reversed non-empty list is reversed" description
{ { 3 1 2 3 } }
[ [ { 1 2 3 } >linked-list list-reverse dup length , list-pop , list-pop , list-pop , drop ] { } make ]
unit-test

"Double reverse" description
{ { 3 2 1 } }
[ [ { 1 2 3 } >linked-list list-reverse list-reverse list-pop , list-pop , list-pop , drop ] { } make ]
unit-test
