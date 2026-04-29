USING: kernel math mosaic-mischief tools.test unicode ;
IN: mosaic-mischief.tests

! TASK: 1 fresh-mosaic
{ { f f f f } } [ 4 fresh-mosaic ] unit-test
{ { } }         [ 0 fresh-mosaic ] unit-test
{ { f } }       [ 1 fresh-mosaic ] unit-test

! TASK: 2 place-tile
{ { f f "ruby" f f } }
[ 5 fresh-mosaic dup 2 "ruby" place-tile ] unit-test

{ { "amber" } }
[ 1 fresh-mosaic dup 0 "amber" place-tile ] unit-test

{ { "amber" f "jade" } }
[ 3 fresh-mosaic dup 0 "amber" place-tile dup 2 "jade" place-tile ] unit-test

! TASK: 3 chip-tile
{ { "ruby" f "jade" } }
[ { "ruby" "lapis" "jade" } clone dup 1 chip-tile ] unit-test

{ { f "lapis" } }
[ { "ruby" "lapis" } clone dup 0 chip-tile ] unit-test

! TASK: 4 recolour-tile
{ { "RUBY" "lapis" "JADE" } }
[ { "RUBY" "LAPIS" "JADE" } clone dup 1 [ >lower ] recolour-tile ] unit-test

{ { 1 20 3 } }
[ { 1 2 3 } clone dup 1 [ 10 * ] recolour-tile ] unit-test

! TASK: 5 snapshot-mosaic
{ { "ruby" "lapis" "jade" } }
[ { "ruby" "lapis" "jade" } snapshot-mosaic ] unit-test

! a snapshot is independent of later mutation of the original
{ { "ruby" "lapis" "jade" } }
[ { "ruby" "lapis" "jade" } clone
  dup snapshot-mosaic swap 0 "amber" place-tile ] unit-test

! TASK: 6 stash-tile
{ V{ "ruby" "lapis" } }
[ V{ } clone dup "ruby" stash-tile dup "lapis" stash-tile ] unit-test

{ V{ "ruby" } }
[ V{ } clone dup "ruby" stash-tile ] unit-test

! TASK: 7 return-tile
{ "jade" }
[ V{ "ruby" "lapis" "jade" } clone return-tile ] unit-test

{ V{ "ruby" "lapis" } }
[ V{ "ruby" "lapis" "jade" } clone dup return-tile drop ] unit-test
