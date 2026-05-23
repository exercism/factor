USING: ascii io io.streams.string kernel locals sequences ;
IN: channel-chatter

: hear-out ( reader -- contents )
    stream-contents ;

: count-messages ( reader -- n )
    stream-lines length ;

: echo-back ( reader -- response )
    stream-lines last >upper ;

:: broadcast ( message writer -- )
    message writer stream-write
    writer stream-flush ;

: capture ( quot -- captured )
    with-string-writer ; inline
