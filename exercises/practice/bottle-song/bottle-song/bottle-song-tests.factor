USING: bottle-song exercism-tools io kernel tools.test unicode ;
IN: bottle-song.tests

"first generic verse" description
{ { "Ten green bottles hanging on the wall," "Ten green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be nine green bottles hanging on the wall." } }
[ 10 1 recite ] unit-test

STOP-HERE

"last generic verse" description
{ { "Three green bottles hanging on the wall," "Three green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be two green bottles hanging on the wall." } }
[ 3 1 recite ] unit-test

"verse with 2 bottles" description
{ { "Two green bottles hanging on the wall," "Two green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be one green bottle hanging on the wall." } }
[ 2 1 recite ] unit-test

"verse with 1 bottle" description
{ { "One green bottle hanging on the wall," "One green bottle hanging on the wall," "And if one green bottle should accidentally fall," "There'll be no green bottles hanging on the wall." } }
[ 1 1 recite ] unit-test

"first two verses" description
{ { "Ten green bottles hanging on the wall," "Ten green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be nine green bottles hanging on the wall." "" "Nine green bottles hanging on the wall," "Nine green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be eight green bottles hanging on the wall." } }
[ 10 2 recite ] unit-test

"last three verses" description
{ { "Three green bottles hanging on the wall," "Three green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be two green bottles hanging on the wall." "" "Two green bottles hanging on the wall," "Two green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be one green bottle hanging on the wall." "" "One green bottle hanging on the wall," "One green bottle hanging on the wall," "And if one green bottle should accidentally fall," "There'll be no green bottles hanging on the wall." } }
[ 3 3 recite ] unit-test

"all verses" description
{ { "Ten green bottles hanging on the wall," "Ten green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be nine green bottles hanging on the wall." "" "Nine green bottles hanging on the wall," "Nine green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be eight green bottles hanging on the wall." "" "Eight green bottles hanging on the wall," "Eight green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be seven green bottles hanging on the wall." "" "Seven green bottles hanging on the wall," "Seven green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be six green bottles hanging on the wall." "" "Six green bottles hanging on the wall," "Six green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be five green bottles hanging on the wall." "" "Five green bottles hanging on the wall," "Five green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be four green bottles hanging on the wall." "" "Four green bottles hanging on the wall," "Four green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be three green bottles hanging on the wall." "" "Three green bottles hanging on the wall," "Three green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be two green bottles hanging on the wall." "" "Two green bottles hanging on the wall," "Two green bottles hanging on the wall," "And if one green bottle should accidentally fall," "There'll be one green bottle hanging on the wall." "" "One green bottle hanging on the wall," "One green bottle hanging on the wall," "And if one green bottle should accidentally fall," "There'll be no green bottles hanging on the wall." } }
[ 10 10 recite ] unit-test
