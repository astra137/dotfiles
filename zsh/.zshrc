#! /bin/zsh

# zmodload zsh/zprof

unset HISTFILE
unset HISTSIZE
unset SAVEHIST
setopt hist_verify  # Confirm !!
setopt no_clobber   # Require >! or >|
zstyle ':completion:*' menu select

fpath+=$ZDOTDIR/lib/pure
autoload -U promptinit && promptinit
prompt pure

fpath+=$ZDOTDIR/lib/zsh-completions/src
. $ZDOTDIR/lib/zsh-autosuggestions/zsh-autosuggestions.zsh
. $ZDOTDIR/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias l="exa -lF --color-scale -a --group-directories-first -b"
alias ll="l -ghHiS --time-style long-iso --git"
alias lla="ll -u -rs accessed"
alias llc="ll -U -rs created"
alias llt="exa -T --git-ignore"
if [[ $(uname) == 'Darwin' ]] {
  alias reset_launchpad="defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock"
  alias reset_systemui="defaults delete com.apple.systemuiserver && killall SystemUIServer"
}

if (( $+commands[direnv] )); then; . <(direnv hook zsh); fi

autoload -Uz compinit && compinit -C

# zprof
