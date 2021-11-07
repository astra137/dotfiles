# dotfiles

> wip

## zsh

```shell
git clone --recurse-submodules -j8 https://github.com/astra137/dotfiles
```

```zsh
#! /usr/bin/env zsh
# .zshenv
export ZDOTDIR=~/code/dotfiles/zsh

export EDITOR="code -w"
# export SHELL_SESSIONS_DISABLE=1

PATH+=:/usr/local/sbin
PATH+=:~/.cargo/bin
PATH+=:~/.deno/bin
PATH+=:~/.local/bin
```
