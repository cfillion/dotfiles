export DVDCSS_CACHE=off
export EDITOR=vim
export ESCDELAY=0

typeset -U path
export GEM_HOME=$(ruby -rubygems -e "puts Gem.user_dir")
path=($path "$GEM_HOME/bin")

