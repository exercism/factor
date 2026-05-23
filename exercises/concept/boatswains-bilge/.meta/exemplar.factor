USING: accessors destructors kernel ;
IN: boatswains-bilge

: drain-bilge ( pump -- )
    dispose ;

: pump-out ( pump quot -- )
    with-disposal ; inline

:: shift-routine ( pump-a pump-b quot -- )
    [ pump-a &dispose pump-b &dispose quot call ] with-destructors ; inline

:: risky-pump-out ( pump quot -- )
    [ pump |dispose quot call ] with-destructors ; inline

TUPLE: valve < disposable is-open ;

: <valve> ( -- valve )
    valve new-disposable t >>is-open ;

M: valve dispose*
    f >>is-open drop ;
