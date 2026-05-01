USING: custom-set exercism-tools io kernel sequences sets sorting tools.test unicode ;
IN: custom-set.tests

"Custom Set:" print

"sets with no elements are empty" print
{ t }
[ <custom-set> null? ]
unit-test

STOP-HERE

"sets with elements are not empty" print
{ f }
[ { 1 } >custom-set null? ]
unit-test

"nothing is contained in an empty set" print
{ f }
[ 1 <custom-set> in? ]
unit-test

"when the element is in the set" print
{ t }
[ 1 { 1 2 3 } >custom-set in? ]
unit-test

"when the element is not in the set" print
{ f }
[ 4 { 1 2 3 } >custom-set in? ]
unit-test

"empty set is a subset of another empty set" print
{ t }
[ <custom-set> <custom-set> subset? ]
unit-test

"empty set is a subset of non-empty set" print
{ t }
[ <custom-set> { 1 } >custom-set subset? ]
unit-test

"non-empty set is not a subset of empty set" print
{ f }
[ { 1 } >custom-set <custom-set> subset? ]
unit-test

"set is a subset of set with exact same elements" print
{ t }
[ { 1 2 3 } >custom-set { 1 2 3 } >custom-set subset? ]
unit-test

"set is a subset of larger set with same elements" print
{ t }
[ { 1 2 3 } >custom-set { 4 1 2 3 } >custom-set subset? ]
unit-test

"set is not a subset of set that does not contain its elements" print
{ f }
[ { 1 2 3 } >custom-set { 4 1 3 } >custom-set subset? ]
unit-test

"the empty set is disjoint with itself" print
{ t }
[ <custom-set> <custom-set> intersects? not ]
unit-test

"empty set is disjoint with non-empty set" print
{ t }
[ <custom-set> { 1 } >custom-set intersects? not ]
unit-test

"non-empty set is disjoint with empty set" print
{ t }
[ { 1 } >custom-set <custom-set> intersects? not ]
unit-test

"sets are not disjoint if they share an element" print
{ f }
[ { 1 2 } >custom-set { 2 3 } >custom-set intersects? not ]
unit-test

"sets are disjoint if they share no elements" print
{ t }
[ { 1 2 } >custom-set { 3 4 } >custom-set intersects? not ]
unit-test

"empty sets are equal" print
{ t }
[ <custom-set> <custom-set> set= ]
unit-test

"empty set is not equal to non-empty set" print
{ f }
[ <custom-set> { 1 2 3 } >custom-set set= ]
unit-test

"non-empty set is not equal to empty set" print
{ f }
[ { 1 2 3 } >custom-set <custom-set> set= ]
unit-test

"sets with the same elements are equal" print
{ t }
[ { 1 2 } >custom-set { 2 1 } >custom-set set= ]
unit-test

"sets with different elements are not equal" print
{ f }
[ { 1 2 3 } >custom-set { 1 2 4 } >custom-set set= ]
unit-test

"set is not equal to larger set with same elements" print
{ f }
[ { 1 2 3 } >custom-set { 1 2 3 4 } >custom-set set= ]
unit-test

"set is equal to a set constructed from an array with duplicates" print
{ t }
[ { 1 } >custom-set { 1 1 } >custom-set set= ]
unit-test

"add to empty set" print
{ { 3 } }
[ <custom-set> dup 3 swap adjoin members natural-sort ]
unit-test

"add to non-empty set" print
{ { 1 2 3 4 } }
[ { 1 2 4 } >custom-set dup 3 swap adjoin members natural-sort ]
unit-test

"adding an existing element does not change the set" print
{ { 1 2 3 } }
[ { 1 2 3 } >custom-set dup 3 swap adjoin members natural-sort ]
unit-test

"intersection of two empty sets is an empty set" print
{ {  } }
[ <custom-set> <custom-set> intersect members natural-sort ]
unit-test

"intersection of an empty set and non-empty set is an empty set" print
{ {  } }
[ <custom-set> { 3 2 5 } >custom-set intersect members natural-sort ]
unit-test

"intersection of a non-empty set and an empty set is an empty set" print
{ {  } }
[ { 1 2 3 4 } >custom-set <custom-set> intersect members natural-sort ]
unit-test

"intersection of two sets with no shared elements is an empty set" print
{ {  } }
[ { 1 2 3 } >custom-set { 4 5 6 } >custom-set intersect members natural-sort ]
unit-test

"intersection of two sets with shared elements is a set of the shared elements" print
{ { 2 3 } }
[ { 1 2 3 4 } >custom-set { 3 2 5 } >custom-set intersect members natural-sort ]
unit-test

"difference of two empty sets is an empty set" print
{ {  } }
[ <custom-set> <custom-set> diff members natural-sort ]
unit-test

"difference of empty set and non-empty set is an empty set" print
{ {  } }
[ <custom-set> { 3 2 5 } >custom-set diff members natural-sort ]
unit-test

"difference of a non-empty set and an empty set is the non-empty set" print
{ { 1 2 3 4 } }
[ { 1 2 3 4 } >custom-set <custom-set> diff members natural-sort ]
unit-test

"difference of two non-empty sets is a set of elements that are only in the first set" print
{ { 1 3 } }
[ { 3 2 1 } >custom-set { 2 4 } >custom-set diff members natural-sort ]
unit-test

"difference removes all duplicates in the first set" print
{ {  } }
[ { 1 1 } >custom-set { 1 } >custom-set diff members natural-sort ]
unit-test

"union of empty sets is an empty set" print
{ {  } }
[ <custom-set> <custom-set> union members natural-sort ]
unit-test

"union of an empty set and non-empty set is the non-empty set" print
{ { 2 } }
[ <custom-set> { 2 } >custom-set union members natural-sort ]
unit-test

"union of a non-empty set and empty set is the non-empty set" print
{ { 1 3 } }
[ { 1 3 } >custom-set <custom-set> union members natural-sort ]
unit-test

"union of non-empty sets contains all unique elements" print
{ { 1 2 3 } }
[ { 1 3 } >custom-set { 2 3 } >custom-set union members natural-sort ]
unit-test
