# VIM

http://www.vim.org/

	$ pacaur -S gvim

Post-installation instructions:

1. Install [Vundle](https://github.com/gmarik/Vundle.vim)

		$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		$ vim +PluginInstall +qall

2. Create missing directories

		$ mkdir ~/.vim/{swap,undo}
