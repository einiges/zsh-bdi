
Without arguments

  $ mkcd a
  $ bdp
  


Argument is number and numbered directories don't occur

  $ hmkcd a/b/c
  $ bdp 2
  a


Best match

  $ hmkcd aaa/bbb/bbb/ccc
  $ bdp b
  aaa/bbb/bbb


Spaced directories

  $ hmkcd "aaa/a b/bbb/ccc"
  $ bdp "a b"
  aaa/a b


Symboled directories

  $ hmkcd "aaa/~ */bbb"
  $ bdp "~ *"
  aaa/~ *


Argument is number and numbered directories occur

  $ hmkcd 1/1.2/1.3
  $ bdp 1
  1


Force number

  $ hmkcd 1/1.2/1.3
  $ bdp -f 1
  1/1.2


Options passed but no directory specified

  $ hmkcd a
  $ bdp -f
  


Force number without a number (expect error)

  $ bdp -f /
  [1]


Shortcut for root (/)

  $ bdp 0
  /


Multiple 0 work as one

  $ cdh
  $ bdp 00
  /


Number greater than parent directories

  $ cdh
  $ bdp $(( ${#PWD//[^\/]/} + 1 ))
  /


Multiple arguments

  $ hmkcd aaa/aab/aac/aad
  $ bdp a b
  aaa/aab


Dots 1

  $ hmkcd aaa/aab/aac
  $ bdp .
  aaa


Dots (to many)

  $ cdh
  $ bdp $(printf '.%.0s' {1..${#PWD//[^\/]/}})
  /


PWD is not a parent

  $ cdh
  $ bdp $PWD:t
  [1]


vim: ft=cram et ts=2 sw=2 sts=2
