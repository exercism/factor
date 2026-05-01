USING: exercism-tools hash-sets kernel lighthouse-logbook tools.test ;
IN: lighthouse-logbook.tests

TASK: 1 empty-log
{ HS{ } } [ empty-log ] unit-test

! a fresh log each call (not the shared HS{ } literal)
{ HS{ "x" } } [ empty-log dup "x" sight ] unit-test
{ HS{ } } [ empty-log ] unit-test

TASK: 2 sight
{ HS{ "NS-1024" } }
[ empty-log dup "NS-1024" sight ] unit-test

{ HS{ "NS-1024" "WB-203" } }
[ empty-log dup "NS-1024" sight dup "WB-203" sight ] unit-test

! adjoining a duplicate is a no-op
{ HS{ "NS-1024" } }
[ empty-log dup "NS-1024" sight dup "NS-1024" sight ] unit-test

TASK: 3 seen?
{ t } [ HS{ "NS-1024" "WB-203" } "NS-1024" seen? ] unit-test
{ f } [ HS{ "NS-1024" "WB-203" } "X-99" seen? ] unit-test
{ f } [ empty-log "anything" seen? ] unit-test

TASK: 4 forget-sighting
{ HS{ "NS-1024" } }
[ HS{ "NS-1024" "WB-203" } clone dup "WB-203" forget-sighting ] unit-test

! removing a missing callsign is a no-op
{ HS{ "NS-1024" } }
[ HS{ "NS-1024" } clone dup "X-99" forget-sighting ] unit-test

TASK: 5 unique-count
{ 3 } [ HS{ "NS-1024" "WB-203" "AC-77" } unique-count ] unit-test
{ 0 } [ empty-log unique-count ] unit-test
{ 1 } [ HS{ "solo" } unique-count ] unit-test

TASK: 6 reachable
! a connected component
{ HS{ "Crozier" "Beacon" "Hadley" "Spiral" "Outpost" } }
[
    "Crozier"
    H{
        { "Crozier"  { "Beacon"  "Hadley"  } }
        { "Beacon"   { "Crozier" "Spiral"  } }
        { "Hadley"   { "Crozier"           } }
        { "Spiral"   { "Beacon"  "Outpost" } }
        { "Outpost"  { "Spiral"            } }
        { "Far-Isle" { "Lonely"            } }
        { "Lonely"   { "Far-Isle"          } }
    }
    reachable
] unit-test

! a disconnected start
{ HS{ "Far-Isle" "Lonely" } }
[
    "Far-Isle"
    H{
        { "Crozier"  { "Beacon"            } }
        { "Beacon"   { "Crozier"           } }
        { "Far-Isle" { "Lonely"            } }
        { "Lonely"   { "Far-Isle"          } }
    }
    reachable
] unit-test

! singleton with no neighbours
{ HS{ "Solo" } }
[ "Solo" H{ { "Solo" { } } } reachable ] unit-test
