# general options
setopt CORRECT
setopt EXTENDED_GLOB
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# keybindings
bindkey -e
bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[2~" overwrite-mode
bindkey "^[[3~" delete-char
bindkey "^[[4~" end-of-line
bindkey "^[[5~" up-history
bindkey "^[[6~" down-history

autoload edit-command-line
zle -N edit-command-line
bindkey "^Xe" edit-command-line

autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[m" copy-earlier-word

# prompt
autoload -U promptinit && promptinit
autoload -U colors && colors
PROMPT="%{$fg[magenta]%}%~%(#.#.>)%{$reset_color%} "
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}] %{$fg[cyan]%}%T%{$reset_color%}"

# history
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
setopt HIST_VERIFY

# completion
autoload -U compinit && compinit
eval "$(fasd --init auto)"
eval "$(dircolors)"
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,cmd'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

# source additional files
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source ~/.aliasrc
source ~/.funcrc

# change behaviour
chpwd()
{
	# automatic ls on directory change
	ls
}

if [[ $TERM = "xterm-256color" ]]; then
	# set i-beam cursor under xterm
	echo -ne "\x1b[\x35 q"
	clear

	# define terminal title at each prompt
	precmd() { print -Pn "\e]0;%m: %~\a" }

	# define terminal title at each command
	preexec() { print -Pn "\e]0;$2 (%~)\a" }
fi

