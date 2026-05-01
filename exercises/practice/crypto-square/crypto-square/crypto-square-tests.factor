USING: crypto-square exercism-tools io kernel tools.test unicode ;
IN: crypto-square.tests

"Crypto Square:" print

"empty plaintext results in an empty ciphertext" print
{ "" }
[ "" ciphertext ] unit-test

STOP-HERE

"normalization results in empty plaintext" print
{ "" }
[ "... --- ..." ciphertext ] unit-test

"Lowercase" print
{ "a" }
[ "A" ciphertext ] unit-test

"Remove spaces" print
{ "b" }
[ "  b " ciphertext ] unit-test

"Remove punctuation" print
{ "1" }
[ "@1,%!" ciphertext ] unit-test

"9 character plaintext results in 3 chunks of 3 characters" print
{ "tsf hiu isn" }
[ "This is fun!" ciphertext ] unit-test

"8 character plaintext results in 3 chunks, the last one with a trailing space" print
{ "clu hlt io " }
[ "Chill out." ciphertext ] unit-test

"54 character plaintext results in 8 chunks, the last two with trailing spaces" print
{ "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau " }
[ "If man was meant to stay on the ground, god would have given us roots." ciphertext ] unit-test
