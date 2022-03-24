#! /bin/zsh

unset HISTFILE
unset HISTSIZE
unset SAVEHIST
setopt histignorealldups
setopt hist_verify
setopt no_clobber
zstyle ':completion:*' menu yes select
zstyle :prompt:pure:git:stash show yes

alias ll='exa -l --classify --color-scale --git --all --binary --group'
alias lt='ll -T --level 3 --git-ignore --ignore-glob .git'

if [[ $(uname) == 'Darwin' ]]; then
  alias reset_launchpad='defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock'
  alias reset_systemui='defaults delete com.apple.systemuiserver && killall SystemUIServer'
fi

fpath+=$ZDOTDIR/functions
autoload -U promptinit && promptinit && prompt pure
. $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -Uz compinit && compinit
