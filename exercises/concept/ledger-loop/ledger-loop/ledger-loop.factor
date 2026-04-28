USING: kernel ;
IN: ledger-loop

: protected-balance ( opening requests -- balance )
    "unimplemented" throw ;

: running-balance ( transactions -- balances )
    "unimplemented" throw ;

: least-balance-so-far ( transactions -- worsts )
    "unimplemented" throw ;
