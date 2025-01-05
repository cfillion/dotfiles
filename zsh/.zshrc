autoload add-zsh-hook compinit edit-command-line zmv

eval "$(dircolors)"
export BROWSER='firefox'
export EDITOR='vim'
export LESS='-iRQ'
export PAGER='less'
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# export DVDCSS_CACHE='off'
# export ESCDELAY=0
# export GCC_COLORS='auto'

export GEM_HOME="$(ruby -e 'puts Gem.user_dir' 2>/dev/null)"
[ -n "$GEM_HOME" ] && path=($path "$GEM_HOME/bin")

source ~/.zsh/aliases
source ~/.zsh/functions

# changing directories
setopt AUTO_CD
setopt AUTO_PUSHD
# setopt CHASE_LINKS

_chpwd() { ls; [[ -d .git ]] && st }
add-zsh-hook chpwd _chpwd

# line editor
setopt NO_BEEP
setopt NO_COMBINING_CHARS # show accidental NFD

zle -N edit-command-line

bindkey -e
bindkey '^V'      vi-quoted-insert
bindkey '^[e'     edit-command-line
bindkey '^[[H'    beginning-of-line # Home
bindkey '^[[F'    end-of-line       # End
bindkey '^[[2~'   overwrite-mode    # Insert
bindkey '^[[3~'   delete-char       # Delete
bindkey '^[[5~'   beginning-of-buffer-or-history # PgUp
bindkey '^[[6~'   end-of-buffer-or-history       # PgDown
bindkey '^[[1;2D' backward-word # Shift+Left
bindkey '^[[1;5D' backward-word # Ctrl+Left
bindkey '^[[1;2C' forward-word  # Shift+Right
bindkey '^[[1;5C' forward-word  # Ctrl+Right
bindkey '^[[A'    up-line-or-search # Up
bindkey '^[[1;2A' up-line-or-history # Shift+Up
bindkey '^[[B'    down-line-or-search # Down
bindkey '^[[1;2B' down-line-or-history # Shift+Down
bindkey '^[[Z'    reverse-menu-complete # Shift+Tab
bindkey '^[[1;5A' history-substring-search-up # Ctrl+Up
bindkey '^[[1;5B' history-substring-search-down # Ctrl+Down

# completion
compinit -i -d ~/.cache/zcompdump # after bindkey

setopt COMPLETE_IN_WORD
setopt LIST_PACKED
setopt NO_LIST_AMBIGUOUS
setopt NO_LIST_BEEP

zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*' complete-options true
zstyle ':completion:*' completer _complete _prefix # removes _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' add-space true # for _prefix
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' matcher-list '' \
  'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:complete:-command-:*' group-order aliases functions
zstyle ':completion:*:complete:-command-::functions' ignored-patterns '_*'
zstyle ':completion:*:descriptions' format '%F{white}[%d]%f'
zstyle ':completion:*:kill:*' tag-order '!process-groups'
zstyle ':completion:*:processes' command 'ps -u $USER -o pid,%cpu,cmd'
zstyle ':completion:*:ssh:argument-1:*' tag-order '!users'

# globbing
setopt EXTENDED_GLOB
setopt GLOB_STAR_SHORT
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT

# help (Alt+H)
unalias run-help 2>/dev/null
autoload run-help run-help-btrfs run-help-git run-help-ip
autoload run-help-openssl run-help-sudo

# history
HISTSIZE=4096
SAVEHIST=$HISTSIZE
HISTFILE=~/.zhistory

setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_LEX_WORDS
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# input/output
setopt APPEND_CREATE
setopt CORRECT
setopt INTERACTIVE_COMMENTS
setopt NO_CLOBBER
setopt PIPE_FAIL
setopt RM_STAR_SILENT # covered by rm alias

CORRECT_IGNORE='_*'

# plugins
ZPLUGINS=/usr/share/zsh/plugins
. $ZPLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. $ZPLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh
unset ZPLUGINS

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=magenta,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=black'

# prompt
PS1="%{%(!.%S%F{red}.%F{magenta})%}[%30<…<%~]%(!.#.$)%{%f%s%} "
RPS1="%(?..%{%B%F{red}%}(exit=%?%)%{%f%b%})"
RPS1+="%(1j. %{%B%F{green}%}(%j jobs)%{%f%b%}.)"
if [ -v SUDO_USER ]; then RPS1+=" %{%F{yellow}%}[%n@%m]%{%f%}"
elif [ -v SSH_TTY ]; then RPS1+=" %{%F{cyan}%}[%m]%{%f%}"; fi
ZLE_RPROMPT_INDENT=0

setopt TRANSIENT_RPROMPT

# terminal emulator
tabs -2

if [ -v SUDO_USER ]; then _title_prefix="[%n@%m] "
elif [ -v SSH_TTY ]; then _title_prefix="[%m] "; fi
_set-term-title-idle() { print -Pn "\e]0;${_title_prefix}[%~]\a"    }
_set-term-title-exec() { print -Pn "\e]0;${_title_prefix}[%~] $2\a" }
_set-term-currentdir() { print -Pn "\e]7;file://%d\a" }
add-zsh-hook chpwd   _set-term-currentdir
add-zsh-hook precmd  _set-term-title-idle
add-zsh-hook preexec _set-term-title-exec
