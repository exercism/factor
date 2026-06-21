USING: exercism-tools kernel ledger-lookout tools.test ;
IN: ledger-lookout.tests

TASK: 1 valid-amount?
{ t } [ "$100" valid-amount? ] unit-test

STOP-HERE

{ t } [ "$100.50" valid-amount? ] unit-test
{ f } [ "$100.5" valid-amount? ] unit-test
{ f } [ "100" valid-amount? ] unit-test
{ f } [ "$100.500" valid-amount? ] unit-test

TASK: 2 dollar-amounts
{ { "100" "25" } } [ "spent $100 and $25 today" dollar-amounts ] unit-test
{ { } } [ "no figures here" dollar-amounts ] unit-test
{ { "5" } } [ "$5" dollar-amounts ] unit-test

TASK: 3 percentages
{ { "5" "12" } } [ "up 5% then down 12%" percentages ] unit-test
{ { } } [ "no percents here" percentages ] unit-test
{ { "100" } } [ "100% sure" percentages ] unit-test

TASK: 4 flagged?
{ t } [ "Issued a REFUND today" flagged? ] unit-test
{ f } [ "a normal sale" flagged? ] unit-test
{ t } [ "chargeback received" flagged? ] unit-test
{ t } [ "Refund and ChargeBack" flagged? ] unit-test
