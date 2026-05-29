USING: exercism-tools grade-school io kernel locals sequences tools.test unicode ;
IN: grade-school.tests
:: add-results ( students -- bools )
    <school> :> s students [ first2 [ s ] 2dip add-student ] map ;
:: add-all ( students -- school )
    <school> :> s students [ first2 [ s ] 2dip add-student drop ] each s ;

"Roster is empty when no student is added" description
{ { } } [ { } add-all roster ] unit-test

STOP-HERE

"Add a student" description
{ { t } } [ { { "Aimee" 2 } } add-results ] unit-test

"Student is added to the roster" description
{ { "Aimee" } } [ { { "Aimee" 2 } } add-all roster ] unit-test

"Adding multiple students in the same grade in the roster" description
{ { t t t } } [ { { "Blair" 2 } { "James" 2 } { "Paul" 2 } } add-results ] unit-test

"Multiple students in the same grade are added to the roster" description
{ { "Blair" "James" "Paul" } } [ { { "Blair" 2 } { "James" 2 } { "Paul" 2 } } add-all roster ] unit-test

"Cannot add student to same grade in the roster more than once" description
{ { t t f t } } [ { { "Blair" 2 } { "James" 2 } { "James" 2 } { "Paul" 2 } } add-results ] unit-test

"Student not added to same grade in the roster more than once" description
{ { "Blair" "James" "Paul" } } [ { { "Blair" 2 } { "James" 2 } { "James" 2 } { "Paul" 2 } } add-all roster ] unit-test

"Adding students in multiple grades" description
{ { t t } } [ { { "Chelsea" 3 } { "Logan" 7 } } add-results ] unit-test

"Students in multiple grades are added to the roster" description
{ { "Chelsea" "Logan" } } [ { { "Chelsea" 3 } { "Logan" 7 } } add-all roster ] unit-test

"Cannot add same student to multiple grades in the roster" description
{ { t t f t } } [ { { "Blair" 2 } { "James" 2 } { "James" 3 } { "Paul" 3 } } add-results ] unit-test

"Student not added to multiple grades in the roster" description
{ { "Blair" "James" "Paul" } } [ { { "Blair" 2 } { "James" 2 } { "James" 3 } { "Paul" 3 } } add-all roster ] unit-test

"Students are sorted by grades in the roster" description
{ { "Anna" "Peter" "Jim" } } [ { { "Jim" 3 } { "Peter" 2 } { "Anna" 1 } } add-all roster ] unit-test

"Students are sorted by name in the roster" description
{ { "Alex" "Peter" "Zoe" } } [ { { "Peter" 2 } { "Zoe" 2 } { "Alex" 2 } } add-all roster ] unit-test

"Students are sorted by grades and then by name in the roster" description
{ { "Anna" "Barb" "Charlie" "Alex" "Peter" "Zoe" "Jim" } } [ { { "Peter" 2 } { "Anna" 1 } { "Barb" 1 } { "Zoe" 2 } { "Alex" 2 } { "Jim" 3 } { "Charlie" 1 } } add-all roster ] unit-test

"Grade is empty if no students in the roster" description
{ { } } [ { } add-all 1 grade ] unit-test

"Grade is empty if no students in that grade" description
{ { } } [ { { "Peter" 2 } { "Zoe" 2 } { "Alex" 2 } { "Jim" 3 } } add-all 1 grade ] unit-test

"Student not added to same grade more than once" description
{ { "Blair" "James" "Paul" } } [ { { "Blair" 2 } { "James" 2 } { "James" 2 } { "Paul" 2 } } add-all 2 grade ] unit-test

"Student not added to multiple grades" description
{ { "Blair" "James" } } [ { { "Blair" 2 } { "James" 2 } { "James" 3 } { "Paul" 3 } } add-all 2 grade ] unit-test

"Student not added to other grade for multiple grades" description
{ { "Paul" } } [ { { "Blair" 2 } { "James" 2 } { "James" 3 } { "Paul" 3 } } add-all 3 grade ] unit-test

"Students are sorted by name in a grade" description
{ { "Bradley" "Franklin" } } [ { { "Franklin" 5 } { "Bradley" 5 } { "Jeff" 1 } } add-all 5 grade ] unit-test
