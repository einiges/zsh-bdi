# zsh-bdi

Quickly go back to a specific parent directory instead of typing `cd ../../..` redundantly.

---

This is a reimplementation of [Tarrasch](https://github.com/Tarrasch)'s [zsh-bd](https://github.com/Tarrasch/zsh-bd).
It comes with less code,  even more zsh builtin functionality, and a slightly improved [directory choosing algorithm](#algorithm).


## Hint

You may be used to quickly go back one directory with `..`, because of `setopt autocd`.
Well, add `alias ..=bdi` to your `.zshrc` and extend your workflow.


## Usage

`bdi [OPTIONS] [n|parent|{pattern ...}]`

Multiple patterns will be interpreted as `pattern*pattern2*...*patternN`

Pattern can either be a text, to match a parent directory or a number, to go _number_ directories back. [How does bdi chooses the directory](#algorithm).


## Installation

Use your preferred zsh plugin manager. For installation instructions see their sites.

For manual installation, download [zsh-bdi.zsh](./zsh-bdi.zsh) and source the file in your `zshrc`.

## Algorithm

1. If _bdi_ is called without arguments, it simply goes one directory back.

2. _bdi_ tries to find a directory that matches the passed pattern. [\*]

3. _bdi_ tries to find a directory beginning with the passed pattern. [\*]

4. If argument is a sequence of dots `.`, go amount of dots + 1 back. `bdi .` is the same as `bdi -f 2`.

5. If the passed pattern is a _number_, _bdi_ goes _number_ directories back.  If the passed _number_ is greater than the possible amount of parent directories, the new pwd will be / and **no** error will be raised. 0 is treated as a shortcut to /.

[\*] If there are more than one, _bdi_ chooses the closest to _pwd_.
