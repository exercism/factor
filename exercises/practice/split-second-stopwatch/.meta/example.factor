USING: accessors arrays kernel math math.parser sequences splitting ;
IN: split-second-stopwatch

TUPLE: stopwatch state current history ;

: <stopwatch> ( -- stopwatch )
    stopwatch new
    "ready" >>state
    0 >>current
    V{ } clone >>history ;

: parse-time ( str -- seconds )
    ":" split [ string>number ] map first3
    [ 3600 * ] [ 60 * ] [ ] tri* + + ;

: pad2 ( n -- str ) number>string 2 CHAR: 0 pad-head ;

: format-time ( seconds -- str )
    [ 3600 /i pad2 ] [ 60 /i 60 mod pad2 ] [ 60 mod pad2 ] tri
    ":" glue ":" glue ;

: state ( stopwatch -- str ) state>> ;

: current-lap ( stopwatch -- str ) current>> format-time ;

: total ( stopwatch -- str )
    [ history>> sum ] [ current>> ] bi + format-time ;

: previous-laps ( stopwatch -- seq )
    history>> [ format-time ] map >array ;

: start ( stopwatch -- )
    dup state>> "running" =
    [ "cannot start an already running stopwatch" throw ]
    [ "running" >>state drop ] if ;

: stop ( stopwatch -- )
    dup state>> "running" =
    [ "stopped" >>state drop ]
    [ "cannot stop a stopwatch that is not running" throw ] if ;

: reset ( stopwatch -- )
    dup state>> "stopped" =
    [ "ready" >>state 0 >>current V{ } clone >>history drop ]
    [ "cannot reset a stopwatch that is not stopped" throw ] if ;

: lap ( stopwatch -- )
    dup state>> "running" =
    [ dup current>> over history>> push 0 >>current drop ]
    [ "cannot lap a stopwatch that is not running" throw ] if ;

: advance-time ( str stopwatch -- )
    dup state>> "running" =
    [ [ parse-time ] dip tuck current>> + >>current drop ]
    [ 2drop ] if ;
