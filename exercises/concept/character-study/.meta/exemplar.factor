USING: combinators kernel math unicode ;
IN: character-study

SYMBOLS: less equal greater
    big small no-size
    alpha numeric space newline unknown ;

: compare-chars ( c1 c2 -- symbol )
    {
        { [ 2dup < ] [ 2drop less ] }
        { [ 2dup > ] [ 2drop greater ] }
        [ 2drop equal ]
    } cond ;

: size-of-char ( c -- symbol )
    {
        { [ dup LETTER? ] [ drop big ] }
        { [ dup letter? ] [ drop small ] }
        [ drop no-size ]
    } cond ;

: change-size-of-char ( c desired -- c' )
    big = [ ch>upper ] [ ch>lower ] if ;

: type-of-char ( c -- symbol )
    {
        { [ dup Letter? ] [ drop alpha ] }
        { [ dup digit? ] [ drop numeric ] }
        { [ dup CHAR: space = ] [ drop space ] }
        { [ dup CHAR: \n = ] [ drop newline ] }
        [ drop unknown ]
    } cond ;
