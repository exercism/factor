USING: accessors combinators kernel locals math math.constants
       math.functions namespaces ;
IN: bering-bearings

SYMBOLS: north east south west
    ahead starboard behind port ;

TUPLE: cardinal direction ;
TUPLE: polar magnitude bearing ;
TUPLE: relative distance bearing ;

SYMBOL: heading

GENERIC: >cartesian ( direction -- x y )

M:: cardinal >cartesian ( c -- x y )
    c direction>> {
        { north [  0  1 ] }
        { east  [  1  0 ] }
        { south [  0 -1 ] }
        { west  [ -1  0 ] }
    } case ;

:: deg>cartesian ( magnitude bearing -- x y )
    bearing pi * 180 / :> rad
    rad sin magnitude *
    rad cos magnitude * ;

M:: polar >cartesian ( p -- x y )
    p magnitude>> p bearing>> deg>cartesian ;

M:: relative >cartesian ( r -- x y )
    r distance>>
    r bearing>> {
        { ahead     [   0 ] }
        { starboard [  90 ] }
        { behind    [ 180 ] }
        { port      [ 270 ] }
    } case
    heading get +
    deg>cartesian ;

GENERIC: flip ( direction -- direction' )

M: cardinal flip
    [ {
        { north [ south ] }
        { east  [ west  ] }
        { south [ north ] }
        { west  [ east  ] }
    } case ] change-direction ;

M: polar flip
    [ 180 + 360 mod ] change-bearing ;

M: relative flip
    [ {
        { ahead     [ behind    ] }
        { starboard [ port      ] }
        { behind    [ ahead     ] }
        { port      [ starboard ] }
    } case ] change-bearing ;

:: add-bearings ( a b -- x y )
    a >cartesian :> ay :> ax
    b >cartesian :> by :> bx
    ax bx +
    ay by + ;
