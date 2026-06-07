USING: cargo-shuffle exercism-tools tools.test ;
IN: cargo-shuffle.tests

TASK: 1 swap the top two crates
{ 2 1 } [ 1 2 swap-crates ] unit-test

STOP-HERE

TASK: 2 clear the spilled crate
{ 1 2 } [ 1 2 3 clear-spill ] unit-test

TASK: 3 keep a copy of the crate underneath
{ 1 2 1 } [ 1 2 peek-under ] unit-test

TASK: 4 tidy the deck
{ 3 3 2 } [ 1 2 3 tidy-deck ] unit-test
