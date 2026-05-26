USING: exercism-tools hamming io kernel tools.test unicode ;
IN: hamming.tests

"empty strands" description
{ 0 } [ "" "" distance ] unit-test

STOP-HERE

"single letter identical strands" description
{ 0 } [ "A" "A" distance ] unit-test

"single letter different strands" description
{ 1 } [ "G" "T" distance ] unit-test

"long identical strands" description
{ 0 } [ "GGACTGAAATCTG" "GGACTGAAATCTG" distance ] unit-test

"long different strands" description
{ 9 } [ "GGACGGATTCTG" "AGGACGGATTCT" distance ] unit-test

"disallow first strand longer" description
[ "AATG" "AAA" distance ] [ "strands must be of equal length" = ] must-fail-with

"disallow second strand longer" description
[ "ATA" "AGTG" distance ] [ "strands must be of equal length" = ] must-fail-with

"disallow empty first strand" description
[ "" "G" distance ] [ "strands must be of equal length" = ] must-fail-with

"disallow empty second strand" description
[ "G" "" distance ] [ "strands must be of equal length" = ] must-fail-with
