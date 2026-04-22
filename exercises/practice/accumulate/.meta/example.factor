USING: arrays kernel locals sequences sequences.extras ;
IN: accumulate

:: accum ( seq quot: ( x -- y ) -- newseq )
  seq >resizable :> seq
  seq length seq new-resizable :> newseq

  [ seq empty? ] [
    seq pop quot call
    newseq push
  ] until

  newseq reverse >array ; inline
