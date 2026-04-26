USING: arrays assocs hashtables kernel locals math sequences
strings vectors ;
IN: connect

CONSTANT: hex-dirs { { -1 0 } { -1 1 } { 0 -1 } { 0 1 } { 1 -1 } { 1 0 } }

:: cell-at ( board rows cols r c -- ch )
    r 0 >= r rows < and c 0 >= c cols < and and
    [ r board nth r c 2 * + swap nth ] [ CHAR: \s ] if ;

:: wins? ( board rows cols ch start-rc goal-rc -- ? )
    H{ } clone :> visited
    V{ } clone :> queue
    start-rc [| rc |
        board rows cols rc first rc second cell-at ch =
        [ rc first cols * rc second + queue push ] when
    ] each
    f :> found!
    0 :> qi!
    [ qi queue length < found not and ] [
        qi queue nth :> key
        qi 1 + qi!
        key visited key? not [
            t key visited set-at
            key cols /i :> r
            key cols mod :> c
            r c goal-rc call( r c -- ? ) [ t found! ] [
                hex-dirs [| d |
                    r d first + :> nr
                    c d second + :> nc
                    board rows cols nr nc cell-at ch = [
                        nr cols * nc + :> nk
                        nk visited key? not [ nk queue push ] when
                    ] when
                ] each
            ] if
        ] when
    ] while
    found ;

:: winner ( board -- str )
    board length :> rows
    rows 0 = [ "" ] [
        board first length 1 + 2 /i :> cols
        board rows cols CHAR: X
        rows <iota> [ 0 2array ] map >array
        [ nip cols 1 - = ] wins?
        [ "X" ] [
            board rows cols CHAR: O
            cols <iota> [ 0 swap 2array ] map >array
            [ drop rows 1 - = ] wins?
            [ "O" ] [ "" ] if
        ] if
    ] if ;
