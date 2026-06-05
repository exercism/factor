USING: arrays deques dlists kernel locals math math.order sequences sets ;
IN: two-bucket

ERROR: goal-not-reachable ;

! The six reachable states from { a b }: fill either bucket, empty
! either bucket, or pour one into the other.
:: bucket-neighbours ( state cap1 cap2 -- states )
    state first2 :> ( a b )
    a cap2 b - min :> p12
    b cap1 a - min :> p21
    cap1 b 2array
    a cap2 2array
    0 b 2array
    a 0 2array 4array
    a p12 - b p12 + 2array
    a p21 + b p21 - 2array 2array
    append ;

:: measure ( cap1 cap2 goal start -- moves goal-bucket other )
    cap1 0 2array :> filled-one
    0 cap2 2array :> filled-two
    start "one" = [ filled-one filled-two ] [ filled-two filled-one ] if
    :> ( start-state forbidden )
    <dlist> :> queue
    HS{ } clone :> seen
    start-state 1 2array queue push-back
    start-state seen adjoin
    f :> answer!
    [ queue deque-empty? not answer f = and ] [
        queue pop-front first2 :> ( state moves )
        state first2 :> ( a b )
        a goal = b goal = or
        [ a goal = [ moves "one" b ] [ moves "two" a ] if 3array answer! ]
        [
            state cap1 cap2 bucket-neighbours [| nxt |
                nxt forbidden = nxt seen in? or
                [ ] [ nxt seen adjoin nxt moves 1 + 2array queue push-back ] if
            ] each
        ] if
    ] while
    answer [ goal-not-reachable ] unless
    answer first3 ;
