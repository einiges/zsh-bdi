
Without arguments

  $ mkcd a
  $ bd
  $ pwd
  


Argument is number and numbered directories don't occur

  $ hmkcd a/b/c
  $ bd 2
  $ pwd
  a


Best match

  $ hmkcd aaa/bbb/bbb/ccc
  $ bd b
  $ pwd
  aaa/bbb/bbb


Spaced directories

  $ hmkcd "aaa/a b/bbb/ccc"
  $ bd "a b"
  $ pwd
  aaa/a b


Symboled directories

  $ hmkcd "aaa/~ */bbb"
  $ bd "~ *"
  $ pwd
  aaa/~ *


Argument is number and numbered directories occur

  $ hmkcd 1/1.2/1.3
  $ bd 1
  $ pwd
  1


Force number

  $ hmkcd 1/1.2/1.3
  $ bd -f 1
  $ pwd
  1/1.2


Options passed but no directory specified

  $ hmkcd a
  $ bd -f
  $ pwd
  


Force number without a number (expect error)

  $ bd -f /
  [1]


Shortcut for root (/)

  $ bd 0
  $ pwd
  /


Multiple 0 work a one

  $ cdh
  $ bd 00
  $ pwd
  /


Number greater than parent directories

  $ cdh
  $ bd $(( ${#PWD//[^\/]/} + 1 ))
  $ pwd
  /


Multiple arguments

  $ hmkcd aaa/aab/aac/aad
  $ bd a b
  $ pwd
  aaa/aab


PWD is not a parent

  $ bd $PWD:t
  [1]


vim: ft=cram et ts=2 sw=2 sts=2
