USING: kernel sequences sets unicode ;
IN: isogram

: isogram? ( phrase -- ? )
    >lower [ Letter? ] filter all-unique? ;
