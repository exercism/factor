USING: accessors kernel math math.order math.statistics sequences sorting ;
IN: high-scores

TUPLE: high-scores scores ;

: <high-scores> ( scores -- hs )
    high-scores boa ;

: scores ( hs -- scores )
    scores>> ;

: latest ( hs -- score )
    scores>> last ;

: personal-best ( hs -- score )
    scores>> supremum ;

: personal-top-three ( hs -- top-three )
    scores>> sort reverse 3 over length min head ;
