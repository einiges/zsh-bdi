
Without arguments

  $ mkcd a
  $ bdi
  $ pwd
  


Argument is number and numbered directories don't occur

  $ hmkcd a/b/c
  $ bdi 2
  $ pwd
  a


Best match

  $ hmkcd aaa/bbb/bbb/ccc
  $ bdi b
  $ pwd
  aaa/bbb/bbb


Spaced directories

  $ hmkcd "aaa/a b/bbb/ccc"
  $ bdi "a b"
  $ pwd
  aaa/a b


Symboled directories

  $ hmkcd "aaa/~ */bbb"
  $ bdi "~ *"
  $ pwd
  aaa/~ *


Argument is number and numbered directories occur

  $ hmkcd 1/1.2/1.3
  $ bdi 1
  $ pwd
  1


Force number

  $ hmkcd 1/1.2/1.3
  $ bdi -f 1
  $ pwd
  1/1.2


Options passed but no directory specified

  $ hmkcd a
  $ bdi -f
  $ pwd
  


Force number without a number (expect error)

  $ bdi -f /
  [1]


Shortcut for root (/)

  $ bdi 0
  $ pwd
  /


Multiple 0 work a one

  $ cdh
  $ bdi 00
  $ pwd
  /


Number greater than parent directories

  $ cdh
  $ bdi $(( ${#PWD//[^\/]/} + 1 ))
  $ pwd
  /


Multiple arguments

  $ hmkcd aaa/aab/aac/aad
  $ bdi a b
  $ pwd
  aaa/aab


PWD is not a parent

  $ bdi $PWD:t
  [1]

Dry run

  $ hmkcd aaa/aab
  $ bdi -d /
  /
  $ pwd
  aaa/aab


vim: ft=cram et ts=2 sw=2 sts=2
