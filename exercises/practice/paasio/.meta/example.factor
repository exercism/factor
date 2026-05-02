USING: accessors destructors io kernel math sequences ;
IN: paasio

TUPLE: metered-input < disposable
    stream { bytes integer } { ops integer } ;

TUPLE: metered-output < disposable
    stream { bytes integer } { ops integer } ;

: <metered-input> ( stream -- m )
    metered-input new-disposable swap >>stream ;

: <metered-output> ( stream -- m )
    metered-output new-disposable swap >>stream ;

INSTANCE: metered-input  input-stream
INSTANCE: metered-output output-stream

<PRIVATE

: bump-ops ( m -- m ) [ 1 + ] change-ops ;

: bump-bytes ( m n -- m ) [ + ] curry change-bytes ;

PRIVATE>

M:: metered-input stream-read1 ( m -- elt/f )
    m stream>> stream-read1 :> elt
    elt [ m 1 bump-bytes drop ] when
    m bump-ops drop
    elt ;

M:: metered-input stream-read-unsafe ( n buf m -- count )
    n buf m stream>> stream-read-unsafe :> count
    m count bump-bytes bump-ops drop
    count ;

M: metered-input stream-element-type stream>> stream-element-type ;

M: metered-input dispose* stream>> dispose ;

M:: metered-output stream-write1 ( elt m -- )
    elt m stream>> stream-write1
    m 1 bump-bytes bump-ops drop ;

M:: metered-output stream-write ( data m -- )
    data m stream>> stream-write
    m data length bump-bytes bump-ops drop ;

M: metered-output stream-flush stream>> stream-flush ;

M: metered-output dispose* stream>> dispose ;
