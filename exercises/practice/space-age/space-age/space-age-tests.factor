USING: io kernel lexer space-age tools.test unicode ;
IN: space-age.tests

: STOP-HERE ( -- ) lexer get [ text>> length ] keep line<< ; parsing

"Space Age:" print

"age on Earth" print
{ 31.69 0.005 } [ 1000000000 earth on-planet ] unit-test~

STOP-HERE

"age on Mercury" print
{ 280.88 0.005 } [ 2134835688 mercury on-planet ] unit-test~

"age on Venus" print
{ 9.78 0.005 } [ 189839836 venus on-planet ] unit-test~

"age on Mars" print
{ 35.88 0.005 } [ 2129871239 mars on-planet ] unit-test~

"age on Jupiter" print
{ 2.41 0.005 } [ 901876382 jupiter on-planet ] unit-test~

"age on Saturn" print
{ 2.15 0.005 } [ 2000000000 saturn on-planet ] unit-test~

"age on Uranus" print
{ 0.46 0.005 } [ 1210123456 uranus on-planet ] unit-test~

"age on Neptune" print
{ 0.35 0.005 } [ 1821023456 neptune on-planet ] unit-test~
