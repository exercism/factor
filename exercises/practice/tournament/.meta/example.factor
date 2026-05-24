USING: accessors arrays assocs combinators formatting kernel locals
       math sequences sorting splitting strings ;
IN: tournament

TUPLE: team w d l ;

: <team> ( -- team ) team new 0 >>w 0 >>d 0 >>l ;

: ensure-team ( name teams -- team )
    [ drop <team> ] cache ;

:: record-row ( row teams -- )
    row ";" split first3 :> ( home away result )
    result {
        { "win"  [ home teams ensure-team [ 1 + ] change-w drop
                   away teams ensure-team [ 1 + ] change-l drop ] }
        { "loss" [ home teams ensure-team [ 1 + ] change-l drop
                   away teams ensure-team [ 1 + ] change-w drop ] }
        { "draw" [ home teams ensure-team [ 1 + ] change-d drop
                   away teams ensure-team [ 1 + ] change-d drop ] }
    } case ;

: points ( team -- p )
    [ w>> 3 * ] [ d>> ] bi + ;

: matches ( team -- mp )
    [ w>> ] [ d>> ] [ l>> ] tri + + ;

:: format-row ( name team -- line )
    name 30 CHAR: \s pad-tail
    team matches team w>> team d>> team l>> team points
    "%s |%3d |%3d |%3d |%3d |%3d" sprintf ;

: team-sort-key ( pair -- key )
    [ second points neg ] [ first ] bi 2array ;

:: tally ( rows -- lines )
    H{ } clone :> teams
    rows [ teams record-row ] each
    "Team                           | MP |  W |  D |  L |  P"
    teams >alist [ team-sort-key ] sort-by
    [ first2 format-row ] map
    swap prefix ;
