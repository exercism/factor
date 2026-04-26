USING: accessors kernel locals math namespaces sequences ;
IN: garden-gathering

TUPLE: plot id registered-to ;

SYMBOLS: registrations next-id not-found ;

: open-garden ( -- )
    V{ } clone registrations set-global
    1 next-id set-global ;

: list-registrations ( -- plots )
    registrations get-global ;

: register ( name -- plot )
    [ next-id get-global ] dip plot boa
    next-id [ 1 + ] change-global
    [ registrations get-global push ] keep ;

:: release ( id -- )
    registrations [ [ id>> id = ] reject ] change-global ;

:: get-registration ( id -- plot/symbol )
    registrations get-global [ id>> id = ] find nip
    [ not-found ] unless* ;

:: find-by-name ( name -- plots )
    registrations get-global [ registered-to>> name = ] filter ;
