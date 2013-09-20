export EDITOR=vim

typeset -U path
export GEM_HOME=$(ruby -rubygems -e "puts Gem.user_dir")
path=($path "$GEM_HOME/bin")
