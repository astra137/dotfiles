#! /bin/zsh

# unset HISTFILE
# unset HISTSIZE
# unset SAVEHIST
setopt hist_verify  # Confirm !!
setopt no_clobber   # Require >! or >|

# TODO
# typeset -gH _comp_dumpfile=${_comp_dumpfile:-$XDG_CACHE_HOME/zsh/compdump}
# [[ -f $_comp_dumpfile && ${${:-${ZDOTDIR:-$HOME}/.zshrc}:P} -nt $_comp_dumpfile ]] &&
#     zf_rm -f $_comp_dumpfile
# zstyle -s :completion: cache-path _ ||
#     zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/compcache"
# zstyle -s ':completion:*' completer _ ||
#     zstyle ':completion:*' completer _expand _complete _ignored

zstyle ':completion:*' menu select

alias l="exa -lF --color-scale -a --group-directories-first -b"
alias ll="l -ghHiS --time-style long-iso --git"
alias lla="ll -u -rs accessed"
alias llc="ll -U -rs created"
alias llt="exa -T --git-ignore"
if [[ $(uname) == 'Darwin' ]] {
  alias reset_launchpad="defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock"
  alias reset_systemui="defaults delete com.apple.systemuiserver && killall SystemUIServer"
}

fpath+="$ZDOTDIR/.zwc"
autoload -Uz zinit

autoload -Uz compinit && compinit -C

# promptinit doesn't work with zwc, so add to fpath.
fpath+="$ZDOTDIR/lib/pure"
autoload -Uz promptinit && promptinit
prompt pure

# src/direnvinit: hook up direnv to chpwd and precmd
autoload -Uz direnvinit && direnvinit

source $ZDOTDIR/lib/zsh-autosuggestions/zsh-autosuggestions.zsh

# last
source $ZDOTDIR/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
