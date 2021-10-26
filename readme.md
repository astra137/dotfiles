# dotfiles

> wip

## zsh

### .zshenv

```zsh
#! /usr/bin/env zsh

export EDITOR="code -w"
export SHELL_SESSIONS_DISABLE=1
#export ZDOTDIR=~
export ZSH_CACHE=~/Library/Caches/zsh

PATH+=:/usr/local/sbin
PATH+=:~/.cargo/bin
PATH+=:~/.deno/bin
PATH+=:~/.local/bin
```

### .zshrc

```zsh
#! /usr/bin/env zsh

unset HISTFILE
unset HISTSIZE
unset SAVEHIST
setopt hist_verify # Confirm !!
setopt no_clobber # Require >! or >|
zstyle ':completion:*' menu select

alias l="exa -lF --color-scale -a --group-directories-first -b"
alias ll="l -ghHiS --time-style long-iso --git"
alias lla="ll -u -rs accessed"
alias llc="ll -U -rs created"
alias llt="exa -T --git-ignore"
alias reset_launchpad="defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock"
alias reset_systemui="defaults delete com.apple.systemuiserver && killall SystemUIServer"

fpath=(~/Code/dotfiles/functions $fpath)
autoload -Uz promptinit plugin zinit

_zinit() {
  echo '#! /usr/bin/env zsh'
  plugin iwata/git-now
  plugin k4rthik/git-cal
  plugin sindresorhus/pure --fpath .
  plugin zsh-users/zsh-autosuggestions
  plugin zsh-users/zsh-completions --fpath src
  plugin zsh-users/zsh-syntax-highlighting
  direnv hook zsh
}

zinit
promptinit && prompt pure
```
