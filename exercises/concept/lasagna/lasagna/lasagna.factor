USING: kernel ;
IN: lasagna

! Define expected-bake-time.

: preparation-time ( layers -- minutes )
    "unimplemented" throw ;

: remaining-time ( current-time -- remaining )
    "unimplemented" throw ;

: total-working-time ( layers current-time -- minutes )
    "unimplemented" throw ;
