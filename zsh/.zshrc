setopt AUTO_CD
setopt CHASE_LINKS
setopt CORRECT
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS
setopt MARK_DIRS
setopt NO_CLOBBER
setopt NUMERIC_GLOB_SORT
setopt RM_STAR_SILENT
unsetopt CASE_GLOB

# environment
export BROWSER='dwb'
export DVDCSS_CACHE='off'
export EDITOR='vim'
export ESCDELAY=0
export GCC_COLORS='auto'
export HOSTNAME=`hostname`
export LESS='-iRX'

typeset -U path
export GEM_HOME=$(ruby -e 'puts Gem.user_dir')
path=("$HOME/.local/bin" $path "$GEM_HOME/bin")

# keybindings
bindkey -e
bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line
bindkey '^[OH'  beginning-of-line
bindkey '^[OF'  end-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[5~' up-history
bindkey '^[[6~' down-history
bindkey '^[[1;2D' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;2C' forward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[Z' reverse-menu-complete

autoload edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line

autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey '^[m' copy-earlier-word

# prompt
autoload -U promptinit && promptinit
autoload -U colors && colors
PROMPT="%(!.%{$fg_bold[red]%}.%{$fg[magenta]%})%30<..<%~%(!.#.>)%{$reset_color%} "
RPROMPT="%(?..[%{$fg[yellow]%}%?%{$reset_color%}] )%(1j.%{$fg_bold[green]%}(%j jobs)%{$reset_color%} .)%m %{$fg[cyan]%}%*%{$reset_color%}"

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# completion
autoload -U compinit && compinit
eval "$(dircolors)"
setopt ALWAYS_TO_END
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,cmd'

# source additional files
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zaliasrc
source ~/.zfuncrc

# behaviour
chpwd()
{
  ls
  [[ -d .git ]] && git status -sb
}

# forcing $TERM to linux is required for xterm
TERM=linux setterm -regtabs 2

case "$TERM" in
'linux')
  ;;
'xterm-256color')
  # i-beam cursor in xterm
  echo -ne "\x1b[\x35 q"

  # define terminal title at each prompt
  precmd() { print -Pn "\e]0;%m: %~\a" }

  # define terminal title at each command
  preexec() { print -Pn "\e]0;$2\a" }
esac
