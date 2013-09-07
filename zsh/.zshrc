autoload -U compinit promptinit
compinit
promptinit
prompt redhat

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_NO_FUNCTIONS

setopt CORRECT
setopt EXTENDED_GLOB
setopt AUTO_CD

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ''
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

if [[ -r ~/.aliasrc ]]; then
	. ~/.aliasrc
fi

