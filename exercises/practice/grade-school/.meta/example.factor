USING: accessors assocs kernel locals sequences sorting ;
IN: grade-school

TUPLE: school students ;

: <school> ( -- school )
    school new H{ } clone >>students ;

:: add-student ( school name grade -- ? )
    school students>> :> students
    name students key?
    [ f ] [ grade name students set-at t ] if ;

: sorted-pairs ( school -- pairs )
    students>> >alist
    [ first ] sort-by
    [ second ] sort-by ;

: roster ( school -- names )
    sorted-pairs keys ;

: grade ( school n -- names )
    [ students>> >alist ] dip
    '[ second _ = ] filter keys sort ;
