source /etc/vimrc

" general settings
set nocompatible
set number
set showcmd
set encoding=utf-8
set mouse=a
set wildmenu
set wildignorecase
set wildignore=.git,*.swp,*.o

" whitespace
set nowrap
set autoindent
set copyindent
set tabstop=3 shiftwidth=3
set backspace=indent,eol,start

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" color scheme
syntax on
color sunburst
hi TabLineFill ctermfg=234

" plugins
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim

" special settings
au BufRead /tmp/mutt-* set tw=72

