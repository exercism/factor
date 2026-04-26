USING: garden-gathering kernel tools.test ;
IN: garden-gathering.tests

! TASK: 1 + 2 open-garden + list-registrations
{ V{ } } [ open-garden list-registrations ] unit-test

! TASK: 3 register
{ T{ plot { id 1 } { registered-to "Emma Balan" } } } [
    open-garden "Emma Balan" register
] unit-test

{
    V{
        T{ plot { id 1 } { registered-to "Emma" } }
        T{ plot { id 2 } { registered-to "Bob" } }
    }
} [
    open-garden
    "Emma" register drop
    "Bob" register drop
    list-registrations
] unit-test

! Plot ids continue increasing even after a release.
{ T{ plot { id 3 } { registered-to "Carol" } } } [
    open-garden
    "Emma" register drop
    "Bob" register drop
    1 release
    "Carol" register
] unit-test

! TASK: 4 release
{ V{ T{ plot { id 1 } { registered-to "Emma" } } } } [
    open-garden
    "Emma" register drop
    "Bob" register drop
    2 release
    list-registrations
] unit-test

! Releasing an unknown id is a no-op.
{ V{ T{ plot { id 1 } { registered-to "Emma" } } } } [
    open-garden
    "Emma" register drop
    7 release
    list-registrations
] unit-test

! TASK: 5 get-registration
{ T{ plot { id 1 } { registered-to "Emma" } } } [
    open-garden
    "Emma" register drop
    1 get-registration
] unit-test

{ not-found } [
    open-garden
    "Emma" register drop
    7 get-registration
] unit-test

{ not-found } [
    open-garden
    1 get-registration
] unit-test

! TASK: 6 find-by-name
{ V{ } } [ open-garden "Emma" find-by-name ] unit-test

{ V{ } } [
    open-garden
    "Bob" register drop
    "Emma" find-by-name
] unit-test

{
    V{ T{ plot { id 1 } { registered-to "Emma" } } }
} [
    open-garden
    "Emma" register drop
    "Bob" register drop
    "Emma" find-by-name
] unit-test

{
    V{
        T{ plot { id 1 } { registered-to "Emma" } }
        T{ plot { id 3 } { registered-to "Emma" } }
    }
} [
    open-garden
    "Emma" register drop
    "Bob" register drop
    "Emma" register drop
    "Emma" find-by-name
] unit-test
