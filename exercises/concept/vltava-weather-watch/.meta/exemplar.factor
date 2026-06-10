USING: io io.encodings.utf8 io.files kernel locals sequences ;
IN: vltava-weather-watch

: read-readings ( path -- readings )
    utf8 file-lines ;

: latest-reading ( path -- reading )
    utf8 file-lines last ;

: log-text ( path -- text )
    utf8 file-contents ;

:: record-reading ( reading path -- )
    path utf8 [ reading print ] with-file-appender ;

: rewrite-log ( readings path -- )
    utf8 set-file-lines ;
