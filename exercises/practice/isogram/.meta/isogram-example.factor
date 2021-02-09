USING: kernel sets ;
IN: isogram

: isogram? ( str -- ? )
  dup "" set-like = ;
