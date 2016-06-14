USING: exercism-testing help help.markup help.syntax strings ;

HELP: verify-config
  { $description
    "Verifies an Exercism "
    { $snippet "config.json" }
    "'s "
    { $snippet "\"problems\"" }
    " and "
    { $snippet "\"deprecated\"" }
    " keys in two ways: that they have mutually exclusive values, and that all of "
    { $snippet "\"problems\"" }
    "'s entries are implemented in "
    { $snippet "exercises/" }
    " while none of  "
    { $snippet "\"deprecated\"" }
    "'s are."
  } ;

HELP: run-exercism-test
  { $values { "test-name" string } }
  { $description "Runs the Exercism test with slug " { $snippet "test-name"} "." }
  { $notes
    { $snippet { $emphasis "test-name" } "-tests.factor" }
    " and "
    { $snippet { $emphasis "test-name" } "-example.factor" }
    " should both exist, inside "
    { $snippet "exercises/test-name" }
    "."
  } ;

HELP: run-all-exercism-tests
  { $description
    "Runs all Exercism exercise tests found in "
    { $snippet "exercises/" }
    "."
  } ;

HELP: choose-suite
  { $values { "arg" string } }
  { $description
    "Runs tests for problem named "
    { $snippet "arg" }
    ", or runs all tests if "
    { $snippet "arg" }
    " is "
    { $snippet "\"run-all\"" }
    "."
  } ;
