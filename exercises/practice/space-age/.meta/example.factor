USING: kernel math ;
IN: space-age

: earth-year ( -- seconds ) 31557600.0 ;

: on-earth   ( seconds -- years ) earth-year / ;
: on-mercury ( seconds -- years ) on-earth 0.2408467   / ;
: on-venus   ( seconds -- years ) on-earth 0.61519726  / ;
: on-mars    ( seconds -- years ) on-earth 1.8808158   / ;
: on-jupiter ( seconds -- years ) on-earth 11.862615   / ;
: on-saturn  ( seconds -- years ) on-earth 29.447498   / ;
: on-uranus  ( seconds -- years ) on-earth 84.016846   / ;
: on-neptune ( seconds -- years ) on-earth 164.79132   / ;
