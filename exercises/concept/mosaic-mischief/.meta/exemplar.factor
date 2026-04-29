USING: arrays kernel sequences ;
IN: mosaic-mischief

: fresh-mosaic ( n -- row )
    f <array> ;

: place-tile ( row position colour -- )
    spin set-nth ;

: chip-tile ( row position -- )
    f spin set-nth ;

: recolour-tile ( row position quot -- )
    [ swap ] dip change-nth ; inline

: snapshot-mosaic ( row -- copy )
    clone ;

: stash-tile ( hoard tile -- )
    swap push ;

: return-tile ( hoard -- tile )
    pop ;
