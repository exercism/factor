USING: arrays kernel locals math math.combinatorics ranges
sequences ;
IN: killer-sudoku-helper

:: combinations ( target size exclude -- combos )
    1 9 [a..b] [ exclude member? not ] filter
    size all-combinations
    [ sum target = ] filter
    [ >array ] map ;
