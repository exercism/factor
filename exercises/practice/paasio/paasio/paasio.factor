USING: destructors io kernel ;
IN: paasio

! Define `metered-input` and `metered-output` tuples that wrap an
! underlying input or output stream, then implement the stream
! protocol generics so reads/writes update the wrapper's `bytes`
! and `ops` slots.
!
! For the wrappers to plug into Factor's I/O, you'll need to
! provide methods on `stream-read1`, `stream-read-unsafe`,
! `stream-element-type`, and `dispose*` for `metered-input`;
! `stream-write1`, `stream-write`, `stream-flush`, and `dispose*`
! for `metered-output`. Mark them as instances of the
! `input-stream` / `output-stream` mixins so they're recognized
! by Factor's I/O combinators.

: <metered-input> ( stream -- m ) "unimplemented" throw ;
: <metered-output> ( stream -- m ) "unimplemented" throw ;
