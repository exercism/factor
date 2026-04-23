USING: annalyns-infiltration tools.test ;
IN: annalyns-infiltration.tests

! TASK: 1 fast attack
{ t } [ f can-do-fast-attack ] unit-test
{ f } [ t can-do-fast-attack ] unit-test

! TASK: 2 spying
{ f } [ f f f can-spy ] unit-test
{ t } [ f f t can-spy ] unit-test
{ t } [ f t f can-spy ] unit-test
{ t } [ f t t can-spy ] unit-test
{ t } [ t f f can-spy ] unit-test
{ t } [ t f t can-spy ] unit-test
{ t } [ t t t can-spy ] unit-test

! TASK: 3 signaling prisoner
{ f } [ f f can-signal-prisoner ] unit-test
{ t } [ f t can-signal-prisoner ] unit-test
{ f } [ t f can-signal-prisoner ] unit-test
{ f } [ t t can-signal-prisoner ] unit-test

! TASK: 4 freeing prisoner
{ f } [ f f f f can-free-prisoner ] unit-test
{ t } [ f f f t can-free-prisoner ] unit-test
{ t } [ f f t f can-free-prisoner ] unit-test
{ t } [ f f t t can-free-prisoner ] unit-test
{ f } [ f t f f can-free-prisoner ] unit-test
{ f } [ f t f t can-free-prisoner ] unit-test
{ f } [ f t t f can-free-prisoner ] unit-test
{ f } [ f t t t can-free-prisoner ] unit-test
{ f } [ t f f f can-free-prisoner ] unit-test
{ t } [ t f f t can-free-prisoner ] unit-test
{ f } [ t f t f can-free-prisoner ] unit-test
{ t } [ t f t t can-free-prisoner ] unit-test
{ f } [ t t f f can-free-prisoner ] unit-test
{ f } [ t t f t can-free-prisoner ] unit-test
{ f } [ t t t f can-free-prisoner ] unit-test
{ f } [ t t t t can-free-prisoner ] unit-test
