USING: arrays kernel locals math sequences ;
IN: spiral-matrix

! Walk the grid filling 1..n*n, turning clockwise whenever the next cell
! would leave the grid or land on an already-filled cell.
:: spiral-matrix ( n -- matrix )
    n [ n 0 <array> ] replicate :> grid
    { { 0 1 } { 1 0 } { 0 -1 } { -1 0 } } :> dirs
    0 :> r!  0 :> c!  0 :> d!
    n n * [| i |
        i 1 + c r grid nth set-nth
        d dirs nth :> dir
        r dir first + :> nr
        c dir second + :> nc
        nr 0 < nr n >= or
        nc 0 < nc n >= or or
        [ t ] [ nc nr grid nth nth 0 = not ] if
        [ d 1 + 4 mod d! ] when
        d dirs nth :> dir2
        r dir2 first + r!
        c dir2 second + c!
    ] each-integer
    grid ;
