# zsh-bdi

Quickly go back to a specific ancestor directory instead of typing `cd ../../..` redundantly.

---

This is a reimplementation of [Tarrasch](https://github.com/Tarrasch)'s [zsh-bd](https://github.com/Tarrasch/zsh-bd).
It comes with less code, more zsh builtin functionality, and a slightly improved ancestor choosing algorithm.

## Hint

To get the feel of `setopt autocd` back, add `alias ..=bdi` to your `zshrc`.
After that you can go dot-only. `.. ......`


## Usage

`bdi [OPTIONS] PATTERN

Pattern has to follow the notation described below.



## Installation

Use your preferred zsh plugin manager. For installation instructions see their sites.

For manual installation download [bdi](./bdi) and add `autoload -Uz ${LOCATION}/bdi` in your `zshrc`.  
For completions download [\_bdi.zsh](./\_bdi.zsh) and add the directory where the file is located to `$fpath`.



## Pattern notation
Which notations will be considered can be specified with the `-n`-option.
When the passed pattern does not meet the notation requirements it will be
ignored and the next will be tested.

### dot
Treat pattern of repeatedly used periods as amount_of_dots+1 directories.
If the amount of dots is greater than the amount of ancestors, the resulting directory is /.

### empty
Treat a missing pattern as one directory up.

### number
Treat pattern as a number and go amount directories up.
If number is 0 or greater than the amount of possible directories the result will be /.

### word(s)
Treat the pattern as a subsequence of a directory.
If there are more than one, _bdi_ chooses the closest to _pwd_.
Exact matches are prioritized.



## Default order of finding the best matching ancestor

The order can be customized with the `-n`-option.

1. If no arguments are given, go one directory back. (empty)

2. Find ancestor that matches the passed pattern. (word)

3. Find ancestor that begins with the passed pattern. (word)

4. If the passed pattern is a sequence of dots `$\.+^`, go amount of dots +1 ancestors back. (dot)

5. If the passed pattern is a _number_, go _number_ directories back. 0 is a shortcut to /. (number)

6. fail!

