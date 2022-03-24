# dotfiles

> wip

```shell
git clone --recurse-submodules https://github.com/astra137/dotfiles ~/src/dotfiles
```

## zsh

```zsh
# .zshenv devcontainer example
EDITOR="code -w"
ZDOTDIR=~/src/dotfiles/zsh
```

```zsh
# .zshenv macOS example
EDITOR="code -w"
PATH+=:/usr/local/sbin
PATH+=:~/.cargo/bin
PATH+=:~/.deno/bin
SHELL_SESSIONS_DISABLE=1
ZDOTDIR=~/src/dotfiles/zsh
```
