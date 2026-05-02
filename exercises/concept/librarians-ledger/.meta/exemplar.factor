USING: kernel math math.order math.statistics sequences ;
IN: librarians-ledger

: protected-balance ( opening requests -- balance )
    swap [ + 0 max ] reduce ;

: running-balance ( transactions -- balances )
    cum-sum ;

: least-balance-so-far ( transactions -- worsts )
    cum-sum cum-min ;

: halve-until ( principal target -- balances )
    swap [ 2dup < ] [ 2 /i dup ] produce 2nip ;
