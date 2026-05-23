USING: accessors dragons-descendants exercism-tools kernel
       tools.test ;
IN: dragons-descendants.tests

TASK: 1 <dragon>
{ "Falkor" } [ "Falkor" "white" 100 <dragon> name>> ] unit-test

STOP-HERE

{ t } [ "Falkor" "white" 100 <dragon> dragon? ] unit-test
{ 100 } [ "Falkor" "white" 100 <dragon> age>> ] unit-test

TASK: 2 <fire-dragon>
{ "Smaug" } [ "Smaug" "red" 500 1200 <fire-dragon> name>> ] unit-test
{ 1200 }    [ "Smaug" "red" 500 1200 <fire-dragon> flame-temp>> ] unit-test

! fire-dragon predicates: yes for both fire-dragon and dragon
{ t } [ "Smaug" "red" 500 1200 <fire-dragon> dragon? ] unit-test
{ t } [ "Smaug" "red" 500 1200 <fire-dragon> fire-dragon? ] unit-test

TASK: 3 <ice-dragon>
{ "Frosty" } [ "Frosty" "blue" 200 -40 <ice-dragon> name>> ] unit-test
{ -40 }      [ "Frosty" "blue" 200 -40 <ice-dragon> chill-temp>> ] unit-test
{ t } [ "Frosty" "blue" 200 -40 <ice-dragon> dragon? ] unit-test
{ t } [ "Frosty" "blue" 200 -40 <ice-dragon> ice-dragon? ] unit-test

! siblings are siblings, not parents of each other
{ f } [ "Frosty" "blue" 200 -40 <ice-dragon> fire-dragon? ] unit-test
{ f } [ "Smaug" "red" 500 1200 <fire-dragon> ice-dragon? ] unit-test

TASK: 4 <volcano-dragon>
{ "Vesuvius" }
[ "Vesuvius" "red" 1000 1500 99 <volcano-dragon> name>> ] unit-test
{ 1500 }
[ "Vesuvius" "red" 1000 1500 99 <volcano-dragon> flame-temp>> ] unit-test
{ 99 }
[ "Vesuvius" "red" 1000 1500 99 <volcano-dragon> lava-volume>> ] unit-test

! transitive: a volcano-dragon is a fire-dragon and a dragon
{ t } [ "Vesuvius" "red" 1000 1500 99 <volcano-dragon> volcano-dragon? ] unit-test
{ t } [ "Vesuvius" "red" 1000 1500 99 <volcano-dragon> fire-dragon? ] unit-test
{ t } [ "Vesuvius" "red" 1000 1500 99 <volcano-dragon> dragon? ] unit-test

! …but not the other way: a fire-dragon is not a volcano-dragon
{ f } [ "Smaug" "red" 500 1200 <fire-dragon> volcano-dragon? ] unit-test

TASK: 5 age-dragon
! age-dragon mutates the dragon's `age` slot via the inherited change-age accessor

{ 101 } [ "Falkor" "white" 100 <dragon> dup age-dragon age>> ] unit-test

! works on every descendant — accessor inheritance
{ 501 } [ "Smaug" "red" 500 1200 <fire-dragon> dup age-dragon age>> ] unit-test
{ 1001 } [ "Vesuvius" "red" 1000 1500 99 <volcano-dragon> dup age-dragon age>> ] unit-test
