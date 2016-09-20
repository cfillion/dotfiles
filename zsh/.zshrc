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

if [[ "$(uname)" == "Darwin" ]]; then
  eval $(/usr/libexec/path_helper -s)

  [ -d /usr/local/opt/coreutils ] || \
    echo "missing package: coreutils"
  path=(/usr/local/opt/coreutils/libexec/gnubin $path)

  [ -d /usr/local/opt/gnu-tar ] || \
    echo "missing package: gnu-tar"
  path=(/usr/local/opt/gnu-tar/libexec/gnubin $path)

  [ -d /usr/local/share/zsh-completions ] || \
    echo "missing package: zsh-completions"
  fpath=(/usr/local/share/zsh-completions $fpath)

  export BROWSER='open'

  [ -r ~/.homebrew_token ] && \
    export HOMEBREW_GITHUB_API_TOKEN="$(cat ~/.homebrew_token)"
fi

export GEM_HOME=$(ruby -e 'puts Gem.user_dir')
path=("$HOME/.local/bin" "$GEM_HOME/bin" $path)

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
RPROMPT="%(?..[%{$fg[yellow]%}%?%{$reset_color%}])%(1j. %{$fg_bold[green]%}(%j jobs)%{$reset_color%}.)"

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zhistory

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
setopt NO_COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,cmd'

# source additional files
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/aliases
source ~/.zsh/functions

# behaviour
chpwd()
{
  ls
  [[ -d .git ]] && git status -sb
}

# $TERM hack required for this to work in xterm
type setterm \n && TERM=linux setterm -regtabs 2

case "$TERM" in
'linux')
  ;;
'xterm-256color')
  # i-beam cursor in xterm
  echo -ne "\x1b[\x35 q"

  precmd() {
    # define terminal title at each prompt
    print -Pn "\e]0;%m: %~\a"

    # set current directory for Terminal.app (OS X)
    print -Pn "\e]7;%d\a"
  }

  # define terminal title at each command
  preexec() { print -Pn "\e]0;%m: $2\a" }
esac
