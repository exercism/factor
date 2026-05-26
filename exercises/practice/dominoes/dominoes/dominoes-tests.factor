USING: dominoes exercism-tools io kernel tools.test unicode ;
IN: dominoes.tests

"empty input = empty output" description
{ t } [ { } can-chain? ] unit-test

STOP-HERE

"singleton input = singleton output" description
{ t } [ { 0x11 } can-chain? ] unit-test

"singleton that can't be chained" description
{ f } [ { 0x12 } can-chain? ] unit-test

"three elements" description
{ t } [ { 0x12 0x31 0x23 } can-chain? ] unit-test

"can reverse dominoes" description
{ t } [ { 0x12 0x13 0x23 } can-chain? ] unit-test

"can't be chained" description
{ f } [ { 0x12 0x41 0x23 } can-chain? ] unit-test

"disconnected - simple" description
{ f } [ { 0x11 0x22 } can-chain? ] unit-test

"disconnected - double loop" description
{ f } [ { 0x12 0x21 0x34 0x43 } can-chain? ] unit-test

"disconnected - single isolated" description
{ f } [ { 0x12 0x23 0x31 0x44 } can-chain? ] unit-test

"need backtrack" description
{ t } [ { 0x12 0x23 0x31 0x24 0x24 } can-chain? ] unit-test

"separate loops" description
{ t } [ { 0x12 0x23 0x31 0x11 0x22 0x33 } can-chain? ] unit-test

"nine elements" description
{ t } [ { 0x12 0x53 0x31 0x12 0x24 0x16 0x23 0x34 0x56 } can-chain? ] unit-test

"separate three-domino loops" description
{ f } [ { 0x12 0x23 0x31 0x45 0x56 0x64 } can-chain? ] unit-test
