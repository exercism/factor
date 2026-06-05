USING: arrays kernel locals math sequences ;
IN: saddle-points

:: saddle-points ( matrix -- points )
    matrix [| row r |
        row [| cell c |
            cell row maximum =
            cell matrix [ c swap nth ] map minimum =
            and [ r 1 + c 1 + 2array ] [ f ] if
        ] map-index sift
    ] map-index concat ;
