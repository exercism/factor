USING: arrays kernel locals math ranges sequences sets sorting ;
IN: change

ERROR: cannot-make-change ;

:: find-fewest-coins ( coins target -- result )
    target 0 < [ cannot-make-change ] when
    target zero? [ { } ] [
        target 1 + f <array> :> best
        { } 0 best set-nth
        coins members sort :> coin-list
        1 target [a..b] [| amount |
            f :> winner!
            coin-list [| coin |
                amount coin - :> rest
                rest 0 >= [
                    rest best nth :> sub
                    sub f = not [
                        sub coin suffix :> cand
                        winner f =
                        [ cand winner! ]
                        [ cand length winner length < [ cand winner! ] when ] if
                    ] when
                ] when
            ] each
            winner amount best set-nth
        ] each
        target best nth :> answer
        answer f = [ cannot-make-change ] when
        answer sort
    ] if ;
