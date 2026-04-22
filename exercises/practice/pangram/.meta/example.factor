USING: kernel math sequences sets unicode ;
IN: pangram

: pangram? ( sentence -- ? )
    >lower [ Letter? ] filter members length 26 >= ;
