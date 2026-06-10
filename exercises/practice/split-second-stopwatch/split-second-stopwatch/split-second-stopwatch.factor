USING: kernel ;
IN: split-second-stopwatch

! Define a `stopwatch` tuple to hold the current state, the
! current lap's elapsed seconds, and the previously recorded
! laps. `<stopwatch>` should return a new stopwatch in the
! "ready" state.

! `state` returns "ready", "running", or "stopped".
! `current-lap` and `total` return "HH:MM:SS" strings.
! `previous-laps` returns an array of "HH:MM:SS" strings.
! `advance-time` takes an "HH:MM:SS" string and adds it to the
! current lap (only while running).
! `start`, `stop`, `reset`, and `lap` change the state, throwing
! when called from a state that does not allow them.

: <stopwatch> ( -- stopwatch )
    "unimplemented" throw ;

: state ( stopwatch -- str )
    "unimplemented" throw ;

: current-lap ( stopwatch -- str )
    "unimplemented" throw ;

: total ( stopwatch -- str )
    "unimplemented" throw ;

: previous-laps ( stopwatch -- seq )
    "unimplemented" throw ;

: advance-time ( str stopwatch -- )
    "unimplemented" throw ;

: start ( stopwatch -- )
    "unimplemented" throw ;

: stop ( stopwatch -- )
    "unimplemented" throw ;

: reset ( stopwatch -- )
    "unimplemented" throw ;

: lap ( stopwatch -- )
    "unimplemented" throw ;
