USING: exercism-tools hash-sets kernel pirates-path tools.test ;
IN: pirates-path.tests

TASK: 1 tide-queue
{ { 1 2 3 } } [ { 1 2 3 } tide-queue ] unit-test

STOP-HERE

{ { } }       [ { }       tide-queue ] unit-test
{ { "solo" } } [ { "solo" } tide-queue ] unit-test
! FIFO order: items come out in insertion order
{ { "a" "b" "c" "d" } } [ { "a" "b" "c" "d" } tide-queue ] unit-test

TASK: 2 coves-reachable
{ HS{ "Skull Bay" "Hidden Cove" "Reef Point" } } [
    "Skull Bay"
    H{
        { "Skull Bay"   { "Hidden Cove" } }
        { "Hidden Cove" { "Reef Point"  } }
        { "Reef Point"  { } }
        { "Lantern Rock" { "Plank Island" } }
        { "Plank Island" { "Lantern Rock" } }
    } coves-reachable
] unit-test

! singleton with no neighbours
{ HS{ "Solo" } } [
    "Solo" H{ { "Solo" { } } } coves-reachable
] unit-test

! disconnected component
{ HS{ "Lantern Rock" "Plank Island" } } [
    "Lantern Rock"
    H{
        { "Skull Bay"   { "Hidden Cove" } }
        { "Hidden Cove" { "Skull Bay"   } }
        { "Lantern Rock" { "Plank Island" } }
        { "Plank Island" { "Lantern Rock" } }
    } coves-reachable
] unit-test

TASK: 3 hop-count
! start == goal
{ 0 } [
    "Skull Bay" "Skull Bay"
    H{ { "Skull Bay" { } } } hop-count
] unit-test

! one hop
{ 1 } [
    "Skull Bay" "Hidden Cove"
    H{
        { "Skull Bay"   { "Hidden Cove" } }
        { "Hidden Cove" { } }
    } hop-count
] unit-test

! shortest path through a longer route
{ 3 } [
    "Skull Bay" "Smuggler's Hollow"
    H{
        { "Skull Bay"        { "Hidden Cove" "Reef Point" } }
        { "Hidden Cove"      { "Plank Island" } }
        { "Reef Point"       { "Lantern Rock" } }
        { "Plank Island"     { "Smuggler's Hollow" } }
        { "Lantern Rock"     { "Smuggler's Hollow" } }
        { "Smuggler's Hollow" { } }
    } hop-count
] unit-test

! unreachable goal returns f
{ f } [
    "Skull Bay" "Lantern Rock"
    H{
        { "Skull Bay"    { "Hidden Cove" } }
        { "Hidden Cove"  { } }
        { "Lantern Rock" { } }
    } hop-count
] unit-test

TASK: 4 gold-count
{ 200 } [ "Smuggler's Hollow" gold-count ] unit-test
{ 120 } [ "Skull Bay"         gold-count ] unit-test
{ 0 }   [ "Davy Jones' Locker" gold-count ] unit-test

! same input returns same result (caching is transparent to the caller)
{ 80 80 } [ "Hidden Cove" gold-count "Hidden Cove" gold-count ] unit-test

TASK: 5 treasure-route
! among the reachable coves, pick the one with the most gold
{ "Smuggler's Hollow" } [
    "Skull Bay"
    H{
        { "Skull Bay"        { "Hidden Cove" "Reef Point" } }
        { "Hidden Cove"      { "Plank Island" } }
        { "Reef Point"       { "Lantern Rock" } }
        { "Plank Island"     { "Smuggler's Hollow" } }
        { "Lantern Rock"     { "Smuggler's Hollow" } }
        { "Smuggler's Hollow" { } }
    } treasure-route
] unit-test

! when start is isolated, start itself is the only candidate
{ "Plank Island" } [
    "Plank Island"
    H{ { "Plank Island" { } } } treasure-route
] unit-test
