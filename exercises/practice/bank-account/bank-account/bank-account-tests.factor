USING: bank-account concurrency.combinators exercism-tools io kernel locals sequences tools.test unicode ;
IN: bank-account.tests

"Newly opened account has zero balance" description
{ 0 } [
    [let <bank-account> :> a
      a open-account
      a balance
    ]
] unit-test

STOP-HERE

"Single deposit" description
{ 100 } [
    [let <bank-account> :> a
      a open-account
      100 a deposit
      a balance
    ]
] unit-test

"Multiple deposits" description
{ 150 } [
    [let <bank-account> :> a
      a open-account
      100 a deposit
      50 a deposit
      a balance
    ]
] unit-test

"Withdraw once" description
{ 25 } [
    [let <bank-account> :> a
      a open-account
      100 a deposit
      75 a withdraw
      a balance
    ]
] unit-test

"Withdraw twice" description
{ 0 } [
    [let <bank-account> :> a
      a open-account
      100 a deposit
      80 a withdraw
      20 a withdraw
      a balance
    ]
] unit-test

"Can do multiple operations sequentially" description
{ 20 } [
    [let <bank-account> :> a
      a open-account
      100 a deposit
      110 a deposit
      200 a withdraw
      60 a deposit
      50 a withdraw
      a balance
    ]
] unit-test

"Cannot check balance of closed account" description
[
    [let <bank-account> :> a
      a open-account
      a close-account
      a balance
    ]
] must-fail

"Cannot deposit into closed account" description
[
    [let <bank-account> :> a
      a open-account
      a close-account
      50 a deposit
    ]
] must-fail

"Cannot deposit into unopened account" description
[
    [let <bank-account> :> a
      50 a deposit
    ]
] must-fail

"Cannot withdraw from closed account" description
[
    [let <bank-account> :> a
      a open-account
      a close-account
      50 a withdraw
    ]
] must-fail

"Cannot close an account that was not opened" description
[
    [let <bank-account> :> a
      a close-account
    ]
] must-fail

"Cannot open an already opened account" description
[
    [let <bank-account> :> a
      a open-account
      a open-account
    ]
] must-fail

"Reopened account does not retain balance" description
{ 0 } [
    [let <bank-account> :> a
      a open-account
      50 a deposit
      a close-account
      a open-account
      a balance
    ]
] unit-test

"Cannot withdraw more than deposited" description
[
    [let <bank-account> :> a
      a open-account
      25 a deposit
      50 a withdraw
    ]
] must-fail

"Cannot withdraw negative" description
[
    [let <bank-account> :> a
      a open-account
      100 a deposit
      -50 a withdraw
    ]
] must-fail

"Cannot deposit negative" description
[
    [let <bank-account> :> a
      a open-account
      -50 a deposit
    ]
] must-fail

"Can handle concurrent transactions" description
{ 0 } [
    [let <bank-account> :> a
      a open-account
      1000 <iota> [ drop 1 a deposit 1 a withdraw ] parallel-each
      a balance
    ]
] unit-test
