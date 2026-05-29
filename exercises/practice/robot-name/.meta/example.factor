USING: accessors hash-sets kernel math namespaces random
sequences sets strings ;
IN: robot-name

TUPLE: robot { name string } ;

SYMBOL: names-issued
HS{ } clone names-issued set-global

: random-letter ( -- ch ) 26 random CHAR: A + ;
: random-digit  ( -- ch ) 10 random CHAR: 0 + ;

: random-name ( -- name )
    2 [ random-letter ] replicate
    3 [ random-digit ] replicate
    append >string ;

: fresh-name ( -- name )
    random-name dup names-issued get-global in?
    [ drop fresh-name ] when ;

: claim-name ( name -- name )
    dup names-issued get-global adjoin ;

: <robot> ( -- robot )
    fresh-name claim-name robot boa ;

: reset-name ( robot -- )
    fresh-name claim-name >>name drop ;
