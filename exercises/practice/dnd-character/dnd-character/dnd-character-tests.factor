USING: accessors assocs combinators.short-circuit dnd-character exercism-tools io kernel math math.order math.statistics sequences tools.test unicode ;
IN: dnd-character.tests
CONSTANT: ability-frequencies
    { 1 4 10 21 38 62 91 122 148 167 172 160 131 94 54 21 }

:: ability-counts ( samples -- counts )
    samples histogram :> h
    16 <iota> [ 3 + h at 0 or ] map ;

: cell-chi2 ( observed expected -- x ) [ - sq ] [ nip ] 2bi /f ;

:: ability-chi-squared ( n -- chi2 )
    n [ ability ] replicate ability-counts
    ability-frequencies [ n 1296 / * ] map
    [ cell-chi2 ] 2map sum ;

: valid-ability? ( score -- ? ) 3 18 between? ;

: valid-character? ( character -- ? )
    {
        [ strength>> valid-ability? ]
        [ dexterity>> valid-ability? ]
        [ constitution>> valid-ability? ]
        [ intelligence>> valid-ability? ]
        [ wisdom>> valid-ability? ]
        [ charisma>> valid-ability? ]
        [ [ hitpoints>> ] [ constitution>> modifier 10 + ] bi = ]
    } 1&& ;


"ability modifier for score 3 is -4" description
{ -4 } [ 3 modifier ] unit-test

STOP-HERE

"ability modifier for score 4 is -3" description
{ -3 } [ 4 modifier ] unit-test

"ability modifier for score 5 is -3" description
{ -3 } [ 5 modifier ] unit-test

"ability modifier for score 6 is -2" description
{ -2 } [ 6 modifier ] unit-test

"ability modifier for score 7 is -2" description
{ -2 } [ 7 modifier ] unit-test

"ability modifier for score 8 is -1" description
{ -1 } [ 8 modifier ] unit-test

"ability modifier for score 9 is -1" description
{ -1 } [ 9 modifier ] unit-test

"ability modifier for score 10 is 0" description
{ 0 } [ 10 modifier ] unit-test

"ability modifier for score 11 is 0" description
{ 0 } [ 11 modifier ] unit-test

"ability modifier for score 12 is +1" description
{ 1 } [ 12 modifier ] unit-test

"ability modifier for score 13 is +1" description
{ 1 } [ 13 modifier ] unit-test

"ability modifier for score 14 is +2" description
{ 2 } [ 14 modifier ] unit-test

"ability modifier for score 15 is +2" description
{ 2 } [ 15 modifier ] unit-test

"ability modifier for score 16 is +3" description
{ 3 } [ 16 modifier ] unit-test

"ability modifier for score 17 is +3" description
{ 3 } [ 17 modifier ] unit-test

"ability modifier for score 18 is +4" description
{ 4 } [ 18 modifier ] unit-test

"every rolled ability is within range" description
{ t } [ 1000 [ ability ] replicate [ valid-ability? ] all? ] unit-test

"a freshly rolled character is valid" description
{ t } [ 1000 [ <character> ] replicate [ valid-character? ] all? ] unit-test

"each ability is only calculated once" description
{ t } [ <character> [ strength>> ] [ strength>> ] bi = ] unit-test

"abilities follow the 4d6-drop-lowest distribution" description
{ t } [ 12960 ability-chi-squared 80 < ] unit-test
