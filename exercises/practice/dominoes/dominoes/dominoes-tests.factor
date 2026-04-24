USING: dominoes io kernel lexer tools.test unicode ;
IN: dominoes.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Dominoes:" print

"empty input = empty output" print
{ t } [ { } can-chain? ] unit-test

STOP-HERE

"singleton input = singleton output" print
{ t } [ { 0x11 } can-chain? ] unit-test

"singleton that can't be chained" print
{ f } [ { 0x12 } can-chain? ] unit-test

"three elements" print
{ t } [ { 0x12 0x31 0x23 } can-chain? ] unit-test

"can reverse dominoes" print
{ t } [ { 0x12 0x13 0x23 } can-chain? ] unit-test

"can't be chained" print
{ f } [ { 0x12 0x41 0x23 } can-chain? ] unit-test

"disconnected - simple" print
{ f } [ { 0x11 0x22 } can-chain? ] unit-test

"disconnected - double loop" print
{ f } [ { 0x12 0x21 0x34 0x43 } can-chain? ] unit-test

"disconnected - single isolated" print
{ f } [ { 0x12 0x23 0x31 0x44 } can-chain? ] unit-test

"need backtrack" print
{ t } [ { 0x12 0x23 0x31 0x24 0x24 } can-chain? ] unit-test

"separate loops" print
{ t } [ { 0x12 0x23 0x31 0x11 0x22 0x33 } can-chain? ] unit-test

"nine elements" print
{ t } [ { 0x12 0x53 0x31 0x12 0x24 0x16 0x23 0x34 0x56 } can-chain? ] unit-test

"separate three-domino loops" print
{ f } [ { 0x12 0x23 0x31 0x45 0x56 0x64 } can-chain? ] unit-test
