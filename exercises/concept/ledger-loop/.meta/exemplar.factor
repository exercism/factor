USING: kernel math math.order math.statistics sequences ;
IN: ledger-loop

: protected-balance ( opening requests -- balance )
    swap [ + 0 max ] reduce ;

: running-balance ( transactions -- balances )
    cum-sum ;

: least-balance-so-far ( transactions -- worsts )
    cum-sum cum-min ;
