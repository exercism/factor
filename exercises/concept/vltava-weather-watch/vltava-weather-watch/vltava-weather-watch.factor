USING: kernel ;
IN: vltava-weather-watch

! Each word receives a path to the station's log file. Reach for
! `file-lines`, `file-contents`, `with-file-appender`, and
! `set-file-lines` from the `io.files` vocabulary, paired with the
! `utf8` encoding from `io.encodings.utf8`.

: read-readings ( path -- readings )
    "unimplemented" throw ;

: latest-reading ( path -- reading )
    "unimplemented" throw ;

: log-text ( path -- text )
    "unimplemented" throw ;

: record-reading ( reading path -- )
    "unimplemented" throw ;

: rewrite-log ( readings path -- )
    "unimplemented" throw ;
