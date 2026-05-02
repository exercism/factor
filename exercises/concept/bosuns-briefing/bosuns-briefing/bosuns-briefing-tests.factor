USING: arrays bosuns-briefing bosuns-briefing.helpers exercism-tools
kernel tools.test ;
IN: bosuns-briefing.tests

TASK: 1 greeting
{ "All hands, attention!" } [ greeting ] unit-test

STOP-HERE

TASK: 2 crew-line
{ "  - Lopez" } [ "Lopez" crew-line ] unit-test
{ "  - Mwangi-Hussein" } [ "Mwangi-Hussein" crew-line ] unit-test
{ "  - " } [ "" crew-line ] unit-test

TASK: 3 closing
{ "Carry on." } [ closing ] unit-test

TASK: 4 roster
{ "  - Lopez\n  - Mwangi" } [ { "Lopez" "Mwangi" } roster ] unit-test
{ "  - Tobias" } [ { "Tobias" } roster ] unit-test
{ "" } [ { } roster ] unit-test

TASK: 5 briefing
! Three lines: greeting, roster, closing.
{ "All hands, attention!\n  - Lopez\n  - Mwangi\nCarry on." }
[ { "Lopez" "Mwangi" } briefing ] unit-test

! Briefing with single-name crew.
{ "All hands, attention!\n  - Tobias\nCarry on." }
[ { "Tobias" } briefing ] unit-test

! Briefing with empty crew has an empty middle line.
{ "All hands, attention!\n\nCarry on." }
[ { } briefing ] unit-test
