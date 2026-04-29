USING: assocs concurrency.combinators fry kernel sequences unicode ;
IN: parallel-letter-frequency

: letters-of ( text -- letters )
    [ Letter? ] filter [ ch>lower ] map ;

: calculate-frequencies ( texts -- counts )
    [ letters-of ] parallel-map concat
    H{ } clone tuck '[ _ inc-at ] each ;
