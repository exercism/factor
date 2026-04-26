USING: high-school-sweetheart tools.test ;
IN: high-school-sweetheart.tests

! TASK: 1 cleanupname
{ "John Doe" } [ "John-Doe" cleanupname ] unit-test
{ "John Doe" } [ "-John-Doe-" cleanupname ] unit-test

! TASK: 2 firstletter
{ "M" } [ "Mary" firstletter ] unit-test
{ "j" } [ "john" firstletter ] unit-test
{ "S" } [ "\n\t   -Sarah-   " firstletter ] unit-test

! TASK: 3 initial
{ "B." } [ "Betty" initial ] unit-test
{ "J." } [ "james" initial ] unit-test

! TASK: 4 couple
{ "\u{2764} A.  +  C. \u{2764}" } [ "Avery" "Charlie" couple ] unit-test
