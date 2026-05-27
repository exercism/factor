USING: accessors concurrency.locks kernel math typed ;
IN: bank-account

TUPLE: bank-account open? balance lock ;

: <bank-account> ( -- account: bank-account )
    bank-account new
    f >>open?
    0 >>balance
    <lock> >>lock ;

: check-open ( account -- )
    open?>> [ "account not open" throw ] unless ;

: check-positive ( amount -- )
    0 <= [ "amount must be greater than 0" throw ] when ;

TYPED:: open-account ( account: bank-account -- )
    account lock>> [
        account open?>> [ "account already open" throw ] when
        account t >>open? 0 >>balance drop
    ] with-lock ;

TYPED:: close-account ( account: bank-account -- )
    account lock>> [
        account check-open
        account f >>open? drop
    ] with-lock ;

TYPED:: balance ( account: bank-account -- n: integer )
    account lock>> [
        account check-open
        account balance>>
    ] with-lock ;

TYPED:: deposit ( amount: integer account: bank-account -- )
    account lock>> [
        account check-open
        amount check-positive
        account [ amount + ] change-balance drop
    ] with-lock ;

TYPED:: withdraw ( amount: integer account: bank-account -- )
    account lock>> [
        account check-open
        amount check-positive
        amount account balance>> > [ "amount must be less than balance" throw ] when
        account [ amount - ] change-balance drop
    ] with-lock ;
