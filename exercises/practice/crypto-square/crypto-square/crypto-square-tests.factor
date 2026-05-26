USING: crypto-square exercism-tools io kernel tools.test unicode ;
IN: crypto-square.tests

"empty plaintext results in an empty ciphertext" description
{ "" }
[ "" ciphertext ] unit-test

STOP-HERE

"normalization results in empty plaintext" description
{ "" }
[ "... --- ..." ciphertext ] unit-test

"Lowercase" description
{ "a" }
[ "A" ciphertext ] unit-test

"Remove spaces" description
{ "b" }
[ "  b " ciphertext ] unit-test

"Remove punctuation" description
{ "1" }
[ "@1,%!" ciphertext ] unit-test

"9 character plaintext results in 3 chunks of 3 characters" description
{ "tsf hiu isn" }
[ "This is fun!" ciphertext ] unit-test

"8 character plaintext results in 3 chunks, the last one with a trailing space" description
{ "clu hlt io " }
[ "Chill out." ciphertext ] unit-test

"54 character plaintext results in 8 chunks, the last two with trailing spaces" description
{ "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau " }
[ "If man was meant to stay on the ground, god would have given us roots." ciphertext ] unit-test
