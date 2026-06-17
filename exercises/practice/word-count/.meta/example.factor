USING: assocs fry kernel sequences splitting unicode ;
IN: word-count

: count-words ( sentence -- counts )
    >lower
    [ [ CHAR: ' = ] [ digit? ] [ Letter? ] tri or or not ] split-when
    [ [ CHAR: ' = ] trim ] map
    harvest
    H{ } clone
    [ '[ _ inc-at ] each ] keep ;
