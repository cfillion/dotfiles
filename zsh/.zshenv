export EDITOR=vim

typeset -U path
path=($path "$(ruby -rubygems -e "puts Gem.user_dir")/bin")

