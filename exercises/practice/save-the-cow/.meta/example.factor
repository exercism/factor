USING: kernel locals math math.order sequences ;
IN: save-the-cow

! Replay the whole guess history from scratch. `guesses` is a string,
! one character per guess; a guess fails when it reveals nothing new
! (already tried, or absent from the word). The game ends after ten
! failures (a loss) or once every letter is revealed (a win), and any
! further guess after that is an error.

:: guess ( word guesses -- state masked remaining )
    V{ } clone :> tried
    0 :> failures!
    "Ongoing" :> state!
    guesses [| g |
        state "Ongoing" = [
            state "Win" =
            "cannot guess after the game is won"
            "cannot guess after the game is lost" ? throw
        ] unless
        g tried member? g word member? not or
        [ failures 1 + failures! ] when
        g tried push
        word [ tried member? ] all?
        [ "Win" state! ]
        [ failures 10 >= [ "Lose" state! ] when ] if
    ] each
    state
    word [ dup tried member? [ drop CHAR: _ ] unless ] map
    9 failures - 0 max ;
