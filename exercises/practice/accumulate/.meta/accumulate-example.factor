USING: arrays kernel locals sequences sequences.extras ;
IN: accumulate

:: accum ( seq xform: ( a -- b ) -- newseq )
  seq >resizable :> seq
  seq length seq new-resizable :> newseq

  [ seq empty? ] [
    seq pop xform call
    newseq push
  ] until

  newseq reverse >array ; inline

