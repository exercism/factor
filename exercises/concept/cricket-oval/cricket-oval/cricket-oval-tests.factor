USING: cricket-oval exercism-tools tools.test ;
IN: cricket-oval.tests

! Every answer is a float worked out by a math function, so each test
! allows a tiny tolerance with unit-test~.

TASK: 1 boundary-length
{ 439.822971502571 1e-9 } [ 70.0 boundary-length ] unit-test~

STOP-HERE

{ 411.5486376202629 1e-9 } [ 65.5 boundary-length ] unit-test~
{ 502.6548245743669 1e-9 } [ 80 boundary-length ] unit-test~

TASK: 2 distance-from-pitch
{ 50.0 1e-9 } [ 30.0 40.0 distance-from-pitch ] unit-test~
{ 29.0 1e-9 } [ -20.0 -21.0 distance-from-pitch ] unit-test~
{ 70.71067811865476 1e-9 } [ 50.0 50.0 distance-from-pitch ] unit-test~
{ 0.0 1e-9 } [ 0.0 0.0 distance-from-pitch ] unit-test~

TASK: 3 shot-angle
{ 45.0 1e-9 } [ 50.0 50.0 shot-angle ] unit-test~
{ 90.0 1e-9 } [ 0.0 40.0 shot-angle ] unit-test~
{ -90.0 1e-9 } [ 0.0 -40.0 shot-angle ] unit-test~
{ 180.0 1e-9 } [ -30.0 0.0 shot-angle ] unit-test~
{ -135.0 1e-9 } [ -20.0 -20.0 shot-angle ] unit-test~
{ 36.86989764584402 1e-9 } [ 40.0 30.0 shot-angle ] unit-test~

TASK: 4 carry
{ 40.0 1e-9 } [ 28.0 15.0 carry ] unit-test~
{ 79.53294524550965 1e-9 } [ 30.0 30.0 carry ] unit-test~
{ 91.83673469387755 1e-9 } [ 30.0 45.0 carry ] unit-test~

TASK: 5 speed-after
{ 30.0 1e-9 } [ 30.0 0.0 speed-after ] unit-test~
{ 11.03638323514327 1e-9 } [ 30.0 50.0 speed-after ] unit-test~
{ 2.706705664732254 1e-9 } [ 20.0 100.0 speed-after ] unit-test~

TASK: 6 metres-until
{ 0.0 1e-9 } [ 20.0 20.0 metres-until ] unit-test~
{ 34.657359027997266 1e-9 } [ 30.0 15.0 metres-until ] unit-test~
{ 69.31471805599453 1e-9 } [ 24.0 6.0 metres-until ] unit-test~
{ 115.12925464970229 1e-9 } [ 30.0 3.0 metres-until ] unit-test~
