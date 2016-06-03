USING: accessors arrays assocs classes.tuple combinators
  command-line formatting io io.directories io.files io.files.info
  io.pathnames json.reader kernel locals parser prettyprint
  sequences sorting strings tools.test typed vocabs.loader ;
QUALIFIED: sets
QUALIFIED: namespaces
IN: exercism-testing

TUPLE: config
      { problems   array }
      { deprecated array } ;

<PRIVATE

CONSTANT: exercises-folder "exercises" inline

! "leap" -> "exercises/leap/leap-example.factor" "exercises/leap/leap-tests.factor"
TYPED:: test-name>filenames
  ( test-name: string -- example-filename: string tests-filename: string )
  test-name dup exercises-folder prepend-path prepend-path
  { "example.factor" "tests.factor" } [ "-" glue ] with map
  first2 2dup [ exists? ] bi@ and not [
    test-name "junk filenames / no such exercise: %s" sprintf throw
  ] when ;

TYPED: get-config-data ( -- config-data: config )
  "config.json" path>json
  { "problems" "deprecated" } [ swap at ] with map
  config slots>tuple ;

TYPED:: problem-exists? ( name: string -- ? )
  name
  [ get-config-data problems>> member? ]
  [ exercises-folder prepend-path exists? ]
  bi and
  [ name test-name>filenames [ exists? ] bi@ and ]
  [ f ]
  if ;

: handle-hello-world ( -- )
  exercises-folder "hello-world" append-path add-vocab-root
  vocab-roots namespaces:get reverse vocab-roots namespaces:set ; inline

TYPED: child-directories ( path: string -- directories: array )
  directory-entries
  [ directory? ] filter
  [ name>>     ] map ;

TYPED: config-exclusive?
  ( problems: array deprecated: array -- ?: boolean )
  sets:intersect { } = ;

TYPED: config-matches-fs?
  ( dirs: array problems: array deprecated: array -- ?: boolean )
  [ over ] dip sets:intersect { } = -rot
  [ natural-sort ] bi@ = and ;

PRIVATE>

: verify-config ( -- )
  get-config-data dup problems>> [ deprecated>> ] dip 2dup
  [ config-exclusive? ] 2dip

  swap exercises-folder child-directories -rot
  config-matches-fs? and

  [ "config.json OK" print ]
  [ "invalid config.json" throw ]
  if ;

TYPED: run-exercism-test ( test-name: string -- )
  dup dup "\ntesting exercise: %s\n\n" printf
  [ test-name>filenames ] dip
  "hello-world" = [ handle-hello-world ] when
  swap run-file run-test-file ;

: run-all-exercism-tests ( -- )
  exercises-folder child-directories [ run-exercism-test ] each ;

TYPED: choose-suite ( arg: string -- )
  { { [ dup "VERIFY"  =     ] [ drop verify-config                        ] }
    { [ dup "run-all" =     ] [ drop verify-config run-all-exercism-tests ] }
    { [ dup problem-exists? ] [      verify-config run-exercism-test      ] }
      [ verify-config "bad last argument %s: expected 'run-all' or an exercise slug\n\n" printf ]
  } cond ;

: exercism-testing-main ( -- )
  (command-line) last choose-suite ;

MAIN: exercism-testing-main