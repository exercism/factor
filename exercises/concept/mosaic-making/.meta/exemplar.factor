USING: arrays sequences ;
IN: mosaic-making

: tile-strip ( colour -- strip )
    1array ;

: row-of-three ( a b c -- row )
    3array ;

: combine-rows ( rows -- tiles )
    concat ;

: mirror-row ( row -- mirrored )
    reverse ;

: tile-position ( row colour -- index )
    swap index ;

: has-colour? ( row colour -- ? )
    swap member? ;
