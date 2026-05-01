USING: destructors io kernel ;
IN: telegraphers-tape

! 1. Define the tuple — `tape` extends `disposable` with a `wire`
! slot for the underlying input stream.

! TUPLE: tape

: <tape> ( wire -- tape ) "unimplemented" throw ;

! 2. Mark `tape` as an `input-stream` so the protocol's default
!    methods dispatch to your class.

! INSTANCE: tape input-stream

! 3. Implement `stream-read1`. Read bytes from the wire until you
!    hit a Morse symbol (`.`, `-`, or space) or end-of-stream
!    (`f`).

! M: tape stream-read1 ;

! 4. Delegate `stream-element-type` to the wire.

! M: tape stream-element-type ;

! 5. Implement `dispose*` so the wire is closed when the tape is.

! M: tape dispose* ;
