USING: accessors arrays exercism-tools io kernel make math sequences simple-linked-list tools.test unicode ;
IN: simple-linked-list.tests

"Simple Linked List:" print

"Empty list has length of zero" print
{ { 0 } }
[ [ <linked-list> dup length , drop ] { } make ]
unit-test

STOP-HERE

"Singleton list has length of one" print
{ { 1 } }
[ [ { 1 } >linked-list dup length , drop ] { } make ]
unit-test

"Non-empty list has correct length" print
{ { 3 } }
[ [ { 1 2 3 } >linked-list dup length , drop ] { } make ]
unit-test

"Pop from empty list is an error" print
[ <linked-list> list-pop ] [ list-empty? ] must-fail-with

"Can pop from singleton list" print
{ { 1 } }
[ [ { 1 } >linked-list list-pop , drop ] { } make ]
unit-test

"Can pop from non-empty list" print
{ { 2 } }
[ [ { 1 2 } >linked-list list-pop , drop ] { } make ]
unit-test

"Can pop multiple items" print
{ { 2 1 } }
[ [ { 1 2 } >linked-list list-pop , list-pop , drop ] { } make ]
unit-test

"Pop updates the count" print
{ { 2 2 1 1 0 } }
[ [ { 1 2 } >linked-list dup length , list-pop , dup length , list-pop , dup length , drop ] { } make ]
unit-test

"Can push to an empty list" print
{ {  } }
[ [ <linked-list> 1 list-push drop ] { } make ]
unit-test

"Can push to a non-empty list" print
{ {  } }
[ [ { 1 2 } >linked-list 3 list-push drop ] { } make ]
unit-test

"Push updates count" print
{ { 3 } }
[ [ { 1 2 } >linked-list 3 list-push dup length , drop ] { } make ]
unit-test

"Push and pop" print
{ { 2 2 3 1 0 } }
[ [ <linked-list> 1 list-push 2 list-push list-pop , 3 list-push dup length , list-pop , list-pop , dup length , drop ] { } make ]
unit-test

"Peek on empty list is an error" print
[ <linked-list> list-peek ] [ list-empty? ] must-fail-with

"Can peek on singleton list" print
{ { 1 } }
[ [ { 1 } >linked-list dup list-peek , drop ] { } make ]
unit-test

"Can peek on non-empty list" print
{ { 2 } }
[ [ { 1 2 } >linked-list dup list-peek , drop ] { } make ]
unit-test

"Peek does not change the count" print
{ { 2 2 } }
[ [ { 1 2 } >linked-list dup list-peek , dup length , drop ] { } make ]
unit-test

"Can peek after a pop and push" print
{ { 2 2 1 3 } }
[ [ <linked-list> 1 list-push 2 list-push dup list-peek , list-pop , dup list-peek , 3 list-push dup list-peek , drop ] { } make ]
unit-test

"Empty linked list to list is empty" print
{ { {  } } }
[ [ <linked-list> dup linked-list>array , drop ] { } make ]
unit-test

"To list with multiple values" print
{ { { 3 2 1 } } }
[ [ { 1 2 3 } >linked-list dup linked-list>array , drop ] { } make ]
unit-test

"To list after a pop" print
{ { 3 { 4 2 1 } } }
[ [ <linked-list> 1 list-push 2 list-push 3 list-push list-pop , 4 list-push dup linked-list>array , drop ] { } make ]
unit-test

"Reversed empty list has same values" print
{ { {  } } }
[ [ <linked-list> list-reverse dup linked-list>array , drop ] { } make ]
unit-test

"Reversed singleton list is same list" print
{ { { 1 } } }
[ [ { 1 } >linked-list list-reverse dup linked-list>array , drop ] { } make ]
unit-test

"Reversed non-empty list is reversed" print
{ { 3 1 2 3 } }
[ [ { 1 2 3 } >linked-list list-reverse dup length , list-pop , list-pop , list-pop , drop ] { } make ]
unit-test

"Double reverse" print
{ { 3 2 1 } }
[ [ { 1 2 3 } >linked-list list-reverse list-reverse list-pop , list-pop , list-pop , drop ] { } make ]
unit-test
