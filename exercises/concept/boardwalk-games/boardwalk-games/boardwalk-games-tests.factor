USING: boardwalk-games exercism-tools kernel math math.order
random random.mersenne-twister sequences sets sorting tools.test ;
IN: boardwalk-games.tests

TASK: 1 roll-die
{ 6 } [ 4 <mersenne-twister> [ 6 roll-die ] with-random ] unit-test

STOP-HERE

{ 2 } [ 5 <mersenne-twister> [ 6 roll-die ] with-random ] unit-test

! Every roll of a six-sided die lands in 1..6.
{ t } [
    1 <mersenne-twister> [ 200 [ 6 roll-die ] replicate ] with-random
    [ 1 6 between? ] all?
] unit-test

TASK: 2 pick-prize
{ "e" } [
    4 <mersenne-twister>
    [ { "a" "b" "c" "d" "e" } pick-prize ] with-random
] unit-test

{ "b" } [
    5 <mersenne-twister>
    [ { "a" "b" "c" "d" "e" } pick-prize ] with-random
] unit-test

TASK: 3 shuffle-deck
{ { 5 1 3 4 2 } } [
    42 <mersenne-twister> [ { 1 2 3 4 5 } shuffle-deck ] with-random
] unit-test

{ { 2 4 3 5 1 } } [
    7 <mersenne-twister> [ { 1 2 3 4 5 } shuffle-deck ] with-random
] unit-test

! Shuffling keeps exactly the same cards, only reordered.
{ t } [
    13 <mersenne-twister> [ { 3 1 4 1 5 9 } shuffle-deck ] with-random
    natural-sort { 1 1 3 4 5 9 } =
] unit-test

TASK: 4 deal-hand
{ { 30 40 20 } } [
    42 <mersenne-twister> [ { 10 20 30 40 50 } 3 deal-hand ] with-random
] unit-test

{ { 30 50 10 } } [
    7 <mersenne-twister> [ { 10 20 30 40 50 } 3 deal-hand ] with-random
] unit-test

! A dealt hand is distinct cards drawn from the deck.
{ t } [
    7 <mersenne-twister> [ { 10 20 30 40 50 } 3 deal-hand ] with-random
    [ [ { 10 20 30 40 50 } member? ] all? ]
    [ [ length ] [ members length ] bi = ] bi and
] unit-test

TASK: 5 play-seeded
! play-seeded installs the seeded generator and returns the result.
{ 6 } [ 4 [ 6 roll-die ] play-seeded ] unit-test

! The same seed reproduces the same game.
{ t } [
    99 [ { 10 20 30 40 50 } 3 deal-hand ] play-seeded
    99 [ { 10 20 30 40 50 } 3 deal-hand ] play-seeded
    =
] unit-test
