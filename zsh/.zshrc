#! /usr/bin/env zsh

fpath=($ZDOTDIR/functions $fpath)
autoload -Uz $fpath[1]/*(.:t) && zedinit

zed git "https://github.com/sindresorhus/pure"
fpath=($ZDOTDIR/pure $fpath)
autoload -Uz promptinit && promptinit
prompt pure

zed git "https://github.com/zsh-users/zsh-autosuggestions"
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh

zed git "https://github.com/zsh-users/zsh-completions"
fpath=($ZDOTDIR/zsh-completions/src $fpath)
autoload -Uz compinit && compinit

# unset HISTFILE
# unset HISTSIZE
# unset SAVEHIST
setopt hist_verify  # Confirm !!
setopt no_clobber   # Require >! or >|

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

source <(direnv hook zsh)

# INSTALL.md: Note the source command must be at the end of ~/.zshrc.
zed git "https://github.com/zsh-users/zsh-syntax-highlighting"
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
