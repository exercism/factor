USING: assocs fry kernel math math.order sequences sorting ;
IN: pursers-pantry

: create-inventory ( seq -- inventory )
    H{ } clone [ '[ _ inc-at ] each ] keep ;

: add-items ( inventory items -- inventory' )
    [ clone ] dip over '[ _ inc-at ] each ;

: decrement-items ( inventory items -- inventory' )
    [ clone ] dip [
        2dup swap key?
        [ over [ swap [ 1 - 0 max ] change-at ] dip ]
        [ drop ] if
    ] each ;

: remove-item ( inventory item -- inventory' )
    [ clone ] dip swap [ delete-at ] keep ;

: list-inventory ( inventory -- pairs )
    >alist [ second 0 > ] filter sort-keys ;
