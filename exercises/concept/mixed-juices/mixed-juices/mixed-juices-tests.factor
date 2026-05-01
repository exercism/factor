USING: exercism-tools mixed-juices tools.test ;
IN: mixed-juices.tests

TASK: 1 time-to-mix-juice
{ 0.5 } [ "Pure Strawberry Joy" time-to-mix-juice ] unit-test

STOP-HERE

{ 1.5 } [ "Energizer" time-to-mix-juice ] unit-test
{ 1.5 } [ "Green Garden" time-to-mix-juice ] unit-test
{ 3 }   [ "Tropical Island" time-to-mix-juice ] unit-test
{ 5 }   [ "All or Nothing" time-to-mix-juice ] unit-test
{ 2.5 } [ "Limetime" time-to-mix-juice ] unit-test
{ 2.5 } [ "Manic Organic" time-to-mix-juice ] unit-test
{ 2.5 } [ "Papaya & Peach" time-to-mix-juice ] unit-test

TASK: 2 wedges-from-lime / limes-to-cut
{ 6 }  [ "small" wedges-from-lime ] unit-test
{ 8 }  [ "medium" wedges-from-lime ] unit-test
{ 10 } [ "large" wedges-from-lime ] unit-test

{ 6 }
[ 42 { "small" "large" "large" "medium" "small" "large" "large" "medium" } limes-to-cut ]
unit-test

{ 1 } [ 4 { "medium" "small" } limes-to-cut ] unit-test

{ 7 }
[ 80 { "small" "large" "large" "medium" "small" "large" "large" } limes-to-cut ]
unit-test

{ 0 } [ 0 { "small" "large" "medium" } limes-to-cut ] unit-test
{ 0 } [ 10 { } limes-to-cut ] unit-test

TASK: 3 order-times
{ { 3 1.5 2.5 5 0.5 } }
[ { "Tropical Island" "Energizer" "Limetime" "All or Nothing" "Pure Strawberry Joy" } order-times ]
unit-test

{ { 0.5 0.5 2.5 3 5 5 5 1.5 2.5 } }
[ { "Pure Strawberry Joy" "Pure Strawberry Joy" "Vitality" "Tropical Island" "All or Nothing" "All or Nothing" "All or Nothing" "Green Garden" "Limetime" } order-times ]
unit-test

{ { } } [ { } order-times ] unit-test

TASK: 4 remaining-orders
{ { "All or Nothing" "Pure Strawberry Joy" } }
[ 7 { "Tropical Island" "Energizer" "Limetime" "All or Nothing" "Pure Strawberry Joy" } remaining-orders ]
unit-test

{ { "All or Nothing" "Green Garden" "Limetime" } }
[ 13 { "Pure Strawberry Joy" "Pure Strawberry Joy" "Vitality" "Tropical Island" "All or Nothing" "All or Nothing" "All or Nothing" "Green Garden" "Limetime" } remaining-orders ]
unit-test

{ { } }
[ 12 { "Energizer" "Green Garden" "Ruby Glow" "Pure Strawberry Joy" "Tropical Island" "Limetime" } remaining-orders ]
unit-test

{ { "Pure Strawberry Joy" } }
[ 0.2 { "Bananas Gone Wild" "Pure Strawberry Joy" } remaining-orders ]
unit-test
