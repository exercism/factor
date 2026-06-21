USING: regexp ;
IN: ledger-lookout

: valid-amount? ( line -- ? )
    R/ \$\d+(\.\d{2})?/ matches? ;

: dollar-amounts ( line -- amounts )
    R/ (?<=\$)\d+/ all-matching-subseqs ;

: percentages ( line -- nums )
    R/ \d+(?=%)/ all-matching-subseqs ;

: flagged? ( line -- ? )
    R/ refund|chargeback/i re-contains? ;
