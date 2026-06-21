USING: assocs heaps kernel ;
IN: tellers-triage

: new-queue ( -- queue )
    <min-heap> ;

: join-queue ( name priority queue -- queue )
    [ heap-push ] keep ;

: next-name ( queue -- name )
    heap-peek drop ;

: serve-all ( queue -- names )
    heap-pop-all values ;
