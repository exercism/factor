USING: regexp ;
IN: passphrase-patrol

: valid-badge? ( badge -- ? )
    R/ [A-Z]{2}-\d{4}/ matches? ;

: badge-codes ( line -- codes )
    R/ [A-Z]{2}-\d{4}/ all-matching-subseqs ;

: digit-count ( string -- n )
    R/ \d/ count-matches ;

: redact ( line -- line' )
    R/ pass=\S+/ "pass=****" re-replace ;
