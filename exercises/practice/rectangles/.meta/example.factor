USING: kernel locals math ranges sequences ;
IN: rectangles

:: at ( grid r c -- ch )
    r grid nth c swap nth ;

:: h-line? ( grid r c1 c2 -- ? )
    c1 c2 [a..b] [ grid r rot at "+-" member? ] all? ;

:: v-line? ( grid c r1 r2 -- ? )
    r1 r2 [a..b] [ grid swap c at "|+" member? ] all? ;

:: rect? ( grid r1 c1 r2 c2 -- ? )
    grid r1 c1 at CHAR: + =
    grid r1 c2 at CHAR: + = and
    grid r2 c1 at CHAR: + = and
    grid r2 c2 at CHAR: + = and
    [ grid r1 c1 c2 h-line?
      grid r2 c1 c2 h-line? and
      grid c1 r1 r2 v-line? and
      grid c2 r1 r2 v-line? and
    ] [ f ] if ;

:: count-rectangles ( grid -- n )
    grid empty? [ 0 ] [
        grid length :> rows
        grid first length :> cols
        0
        rows [0..b) [| r1 |
            r1 1 + rows [a..b) [| r2 |
                cols [0..b) [| c1 |
                    c1 1 + cols [a..b) [| c2 |
                        grid r1 c1 r2 c2 rect?
                        [ 1 + ] when
                    ] each
                ] each
            ] each
        ] each
    ] if ;
