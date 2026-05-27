USING: kernel math typed ;
IN: bank-account

TUPLE: bank-account ;

: <bank-account> ( -- account )
    "unimplemented" throw ;

TYPED:: open-account ( account: bank-account -- )
    "unimplemented" throw ;

TYPED:: close-account ( account: bank-account -- )
    "unimplemented" throw ;

TYPED:: balance ( account: bank-account -- n: integer )
    "unimplemented" throw ;

TYPED:: deposit ( amount: integer account: bank-account -- )
    "unimplemented" throw ;

TYPED:: withdraw ( amount: integer account: bank-account -- )
    "unimplemented" throw ;
