USING: combinators kernel math sequences strings unicode ;
IN: phone-number

ERROR: invalid-phone-number ;

: strip-punctuation ( phrase -- candidates )
    [ "()-. +" member? ] reject ;

: validate-chars ( candidates -- candidates )
    dup [ digit? ] all? [ invalid-phone-number ] unless ;

: strip-country-code ( digits -- digits' )
    {
        { [ dup length 11 = ] [ unclip CHAR: 1 = [ invalid-phone-number ] unless ] }
        { [ dup length 10 = ] [ ] }
        [ invalid-phone-number ]
    } cond ;

: validate-area-exchange ( digits -- digits )
    dup [ first ] [ fourth ] bi
    [ CHAR: 2 < ] bi@ or [ invalid-phone-number ] when ;

: clean ( phrase -- digits )
    strip-punctuation
    validate-chars
    strip-country-code
    validate-area-exchange ;
