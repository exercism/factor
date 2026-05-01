USING: accessors exercism-tools role-playing-game tools.test ;
IN: role-playing-game.tests

TASK: 1 player tuple defaults
{ f }   [ T{ player } name>> ] unit-test
{ 0 }   [ T{ player } level>> ] unit-test
{ 100 } [ T{ player } health>> ] unit-test
{ f }   [ T{ player } mana>> ] unit-test

TASK: 2 introduce
{ "Merlin" } [ T{ player { name "Merlin" } } introduce ] unit-test
{ "Mighty Magician" } [ T{ player } introduce ] unit-test
{ "Mighty Magician" } [ T{ player { health 8 } } introduce ] unit-test

TASK: 3 revive
{ T{ player { name "Merlin" } { mana 100 } } } [
    T{ player { name "Merlin" } { health 0 } } revive
] unit-test

{ T{ player { health 100 } { mana 100 } } } [
    T{ player { health 0 } { mana 50 } } revive
] unit-test

{ f } [ T{ player { health 50 } } revive ] unit-test
{ f } [ T{ player } revive ] unit-test

TASK: 4 take-damage
{ T{ player { health 70 } } } [ T{ player { health 100 } } 30 take-damage ] unit-test
{ T{ player { health 0 } } } [ T{ player { health 5 } } 30 take-damage ] unit-test
{ T{ player { health 100 } } } [ T{ player { health 100 } } 0 take-damage ] unit-test
