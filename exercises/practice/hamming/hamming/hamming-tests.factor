USING: hamming io kernel lexer tools.test unicode ;
IN: hamming.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Hamming:" print

"empty strands" print
{ 0 } [ "" "" distance ] unit-test

STOP-HERE

"single letter identical strands" print
{ 0 } [ "A" "A" distance ] unit-test

"single letter different strands" print
{ 1 } [ "G" "T" distance ] unit-test

"long identical strands" print
{ 0 } [ "GGACTGAAATCTG" "GGACTGAAATCTG" distance ] unit-test

"long different strands" print
{ 9 } [ "GGACGGATTCTG" "AGGACGGATTCT" distance ] unit-test

"disallow first strand longer" print
[ "AATG" "AAA" distance ] [ "strands must be of equal length" = ] must-fail-with

"disallow second strand longer" print
[ "ATA" "AGTG" distance ] [ "strands must be of equal length" = ] must-fail-with

"disallow empty first strand" print
[ "" "G" distance ] [ "strands must be of equal length" = ] must-fail-with

"disallow empty second strand" print
[ "G" "" distance ] [ "strands must be of equal length" = ] must-fail-with
