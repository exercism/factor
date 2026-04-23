USING: io kernel lexer line-up tools.test unicode ;
IN: line-up.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Line Up:" print

"format smallest non-exceptional ordinal numeral 4" print
{ "Gianna, you are the 4th customer we serve today. Thank you!" }
[ "Gianna" 4 format ] unit-test

STOP-HERE

"format greatest single digit non-exceptional ordinal numeral 9" print
{ "Maarten, you are the 9th customer we serve today. Thank you!" }
[ "Maarten" 9 format ] unit-test

"format non-exceptional ordinal numeral 5" print
{ "Petronila, you are the 5th customer we serve today. Thank you!" }
[ "Petronila" 5 format ] unit-test

"format non-exceptional ordinal numeral 6" print
{ "Attakullakulla, you are the 6th customer we serve today. Thank you!" }
[ "Attakullakulla" 6 format ] unit-test

"format non-exceptional ordinal numeral 7" print
{ "Kate, you are the 7th customer we serve today. Thank you!" }
[ "Kate" 7 format ] unit-test

"format non-exceptional ordinal numeral 8" print
{ "Maximiliano, you are the 8th customer we serve today. Thank you!" }
[ "Maximiliano" 8 format ] unit-test

"format exceptional ordinal numeral 1" print
{ "Mary, you are the 1st customer we serve today. Thank you!" }
[ "Mary" 1 format ] unit-test

"format exceptional ordinal numeral 2" print
{ "Haruto, you are the 2nd customer we serve today. Thank you!" }
[ "Haruto" 2 format ] unit-test

"format exceptional ordinal numeral 3" print
{ "Henriette, you are the 3rd customer we serve today. Thank you!" }
[ "Henriette" 3 format ] unit-test

"format smallest two digit non-exceptional ordinal numeral 10" print
{ "Alvarez, you are the 10th customer we serve today. Thank you!" }
[ "Alvarez" 10 format ] unit-test

"format non-exceptional ordinal numeral 11" print
{ "Jacqueline, you are the 11th customer we serve today. Thank you!" }
[ "Jacqueline" 11 format ] unit-test

"format non-exceptional ordinal numeral 12" print
{ "Juan, you are the 12th customer we serve today. Thank you!" }
[ "Juan" 12 format ] unit-test

"format non-exceptional ordinal numeral 13" print
{ "Patricia, you are the 13th customer we serve today. Thank you!" }
[ "Patricia" 13 format ] unit-test

"format exceptional ordinal numeral 21" print
{ "Washi, you are the 21st customer we serve today. Thank you!" }
[ "Washi" 21 format ] unit-test

"format exceptional ordinal numeral 62" print
{ "Nayra, you are the 62nd customer we serve today. Thank you!" }
[ "Nayra" 62 format ] unit-test

"format exceptional ordinal numeral 100" print
{ "John, you are the 100th customer we serve today. Thank you!" }
[ "John" 100 format ] unit-test

"format exceptional ordinal numeral 101" print
{ "Zeinab, you are the 101st customer we serve today. Thank you!" }
[ "Zeinab" 101 format ] unit-test

"format non-exceptional ordinal numeral 112" print
{ "Knud, you are the 112th customer we serve today. Thank you!" }
[ "Knud" 112 format ] unit-test

"format exceptional ordinal numeral 123" print
{ "Yma, you are the 123rd customer we serve today. Thank you!" }
[ "Yma" 123 format ] unit-test
