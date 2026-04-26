USING: combinators kernel math ;
IN: space-age

SYMBOLS: mercury venus earth mars jupiter saturn uranus neptune ;

CONSTANT: earth-year-seconds 31557600.0

: orbital-period ( planet -- period )
    {
        { mercury [ 0.2408467  ] }
        { venus   [ 0.61519726 ] }
        { earth   [ 1          ] }
        { mars    [ 1.8808158  ] }
        { jupiter [ 11.862615  ] }
        { saturn  [ 29.447498  ] }
        { uranus  [ 84.016846  ] }
        { neptune [ 164.79132  ] }
    } case ;

: on-planet ( seconds planet -- years )
    orbital-period earth-year-seconds * / ;
