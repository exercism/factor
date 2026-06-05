USING: kernel locals math math.combinatorics sequences ;
IN: mixtape-maker

: count-combinations ( n k -- count )
    nCk ;

: count-permutations ( n k -- count )
    nPk ;

: list-combinations ( seq k -- combinations )
    all-combinations ;

: list-permutations ( seq -- permutations )
    all-permutations ;

:: combinations-summing-to ( seq k target -- combinations )
    seq k all-combinations [ sum target = ] filter ;
