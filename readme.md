# dotfiles

> wip

```shell
git clone --recurse-submodules https://github.com/astra137/dotfiles ~/code/dotfiles
```

## zsh

```zsh
#! /bin/zsh
# ~/.zshenv Example
export ZDOTDIR=~/code/dotfiles/zsh
export EDITOR="code -w"
PATH+=:/usr/local/sbin
PATH+=:~/.cargo/bin
PATH+=:~/.deno/bin
PATH+=:~/.local/bin
SHELL_SESSIONS_DISABLE=1
```
