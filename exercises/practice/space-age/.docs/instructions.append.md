# Instructions append

## Words

Declare one symbol per planet:
`mercury`, `venus`, `earth`, `mars`, `jupiter`, `saturn`,
`uranus`, `neptune`.

- `on-planet ( seconds planet -- years )` — convert a number of
  seconds since birth into a number of years on the given planet,
  using `earth-year-seconds` (`31557600.0`) and each planet's
  orbital period as the conversion ratio.
