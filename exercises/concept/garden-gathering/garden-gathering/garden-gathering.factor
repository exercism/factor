USING: kernel namespaces ;
IN: garden-gathering

TUPLE: plot id registered-to ;

SYMBOLS: registrations next-id not-found ;

: open-garden ( -- )
    "unimplemented" throw ;

: list-registrations ( -- plots )
    "unimplemented" throw ;

: register ( name -- plot )
    "unimplemented" throw ;

: release ( id -- )
    "unimplemented" throw ;

: get-registration ( id -- plot/symbol )
    "unimplemented" throw ;

: find-by-name ( name -- plots )
    "unimplemented" throw ;
