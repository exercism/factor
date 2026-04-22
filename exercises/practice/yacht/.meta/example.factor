USING: assocs combinators kernel locals math sequences sets sorting ;
IN: yacht

: count-die ( dice n -- count ) [ = ] curry count ;

: score-number ( dice n -- score ) [ count-die ] keep * ;

:: full-house ( dice -- score )
    dice sort members :> vals
    vals length 2 = [
        vals first dice swap count-die { 2 3 } member?
        [ dice sum ] [ 0 ] if
    ] [ 0 ] if ;

:: four-of-a-kind ( dice -- score )
    dice members [| v |
        v dice swap count-die 4 >=
    ] find nip
    [ 4 * ] [ 0 ] if* ;

: little-straight ( dice -- score )
    sort { 1 2 3 4 5 } = [ 30 ] [ 0 ] if ;

: big-straight ( dice -- score )
    sort { 2 3 4 5 6 } = [ 30 ] [ 0 ] if ;

: yacht-score ( dice -- score )
    dup first [ = ] curry all? [ 50 ] [ 0 ] if ;

: score ( dice category -- score )
    {
        { "ones"            [ 1 score-number ] }
        { "twos"            [ 2 score-number ] }
        { "threes"          [ 3 score-number ] }
        { "fours"           [ 4 score-number ] }
        { "fives"           [ 5 score-number ] }
        { "sixes"           [ 6 score-number ] }
        { "full house"      [ full-house ] }
        { "four of a kind"  [ four-of-a-kind ] }
        { "little straight" [ little-straight ] }
        { "big straight"    [ big-straight ] }
        { "choice"          [ sum ] }
        { "yacht"           [ yacht-score ] }
    } case ;
