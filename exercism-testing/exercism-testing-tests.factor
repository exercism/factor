USING: exercism-testing exercism-testing.private tools.test ;
IN: exercism-testing.tests

{ "exercises/hello-world/hello-world-example.factor"
  "exercises/hello-world/hello-world-tests.factor"
} [ "hello-world" test-name>filenames ] unit-test

{ t } [ "hello-world" problem-exists? ] unit-test
{ f } [ "leap"        problem-exists? ] unit-test

{ { } } [ "bin"                 child-directories ] unit-test
{ { } } [ "exercism-testing"    child-directories ] unit-test
{
  { "hello-world" }
} [ "exercises" child-directories ] unit-test

{ t } [ { } { "hello-world" } config-exclusive? ] unit-test
{ t } [ { "hello-world" } { } config-exclusive? ] unit-test
{ t } [ { } { }               config-exclusive? ] unit-test
{ f } [ { "hello-world" }
        { "hello-world" }
        config-exclusive? ] unit-test

{ t } [ { } { } { } config-matches-fs? ] unit-test
{ t } [
        { "hello-world" }
        { "hello-world" }
        { }
      config-matches-fs? ] unit-test
{ t } [
        { "hello-world" }
        { "hello-world" }
        { "blah" }
      config-matches-fs? ] unit-test
{ f } [
        { "hello-world" }
        { "blah" }
        { "blah" }
      config-matches-fs? ] unit-test
{ f } [
        { "blah" }
        { "hello-world" }
        { "blah" }
      config-matches-fs? ] unit-test
