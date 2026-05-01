USING: kernel locals math sequences ;
IN: forth.builtins

ERROR: empty-stack ;
ERROR: only-one-value-on-the-stack ;
ERROR: divide-by-zero ;

<PRIVATE
:: pop2 ( stack -- stack' a b )
    stack length 0 = [ empty-stack ] when
    stack length 1 = [ only-one-value-on-the-stack ] when
    stack unclip-last :> ( s1 b )
    s1 unclip-last :> ( s2 a )
    s2 a b ;

:: pop1 ( stack -- stack' a )
    stack empty? [ empty-stack ] when
    stack unclip-last ;
PRIVATE>

:: forth+ ( s -- s' ) s pop2 + suffix ;
:: forth- ( s -- s' ) s pop2 - suffix ;
:: forth* ( s -- s' ) s pop2 * suffix ;

:: forth/ ( s -- s' )
    s pop2 :> ( s1 a b )
    b zero? [ divide-by-zero ] when
    s1 a b /i suffix ;

:: forth-dup ( s -- s' )
    s pop1 :> ( s1 a )
    s1 a suffix a suffix ;

:: forth-drop ( s -- s' ) s pop1 drop ;

:: forth-swap ( s -- s' )
    s pop2 :> ( s1 a b )
    s1 b suffix a suffix ;

:: forth-over ( s -- s' )
    s pop2 :> ( s1 a b )
    s1 a suffix b suffix a suffix ;
