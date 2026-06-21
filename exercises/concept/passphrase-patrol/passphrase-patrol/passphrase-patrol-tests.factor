USING: exercism-tools kernel passphrase-patrol tools.test ;
IN: passphrase-patrol.tests

TASK: 1 valid-badge?
{ t } [ "NS-1024" valid-badge? ] unit-test

STOP-HERE

{ f } [ "NS-10" valid-badge? ] unit-test
{ f } [ "ns-1024" valid-badge? ] unit-test
{ f } [ "NS-1024 " valid-badge? ] unit-test
{ t } [ "AB-0007" valid-badge? ] unit-test

TASK: 2 badge-codes
{ { "NS-1024" "AB-0007" } } [ "seen NS-1024 then AB-0007 today" badge-codes ] unit-test
{ { } } [ "no codes here" badge-codes ] unit-test
{ { "QQ-1234" } } [ "QQ-1234" badge-codes ] unit-test

TASK: 3 digit-count
{ 4 } [ "NS-1024" digit-count ] unit-test
{ 0 } [ "abcdef" digit-count ] unit-test
{ 5 } [ "a1b2c3d4e5" digit-count ] unit-test

TASK: 4 redact
{ "user=alice pass=**** ok" } [ "user=alice pass=hunter2 ok" redact ] unit-test
{ "no secrets" } [ "no secrets" redact ] unit-test
{ "pass=**** pass=****" } [ "pass=abc pass=def" redact ] unit-test
