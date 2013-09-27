source /etc/vimrc

set nocompatible
set number
set showcmd
set encoding=utf-8
set mouse=a

syntax on
color sunburst
filetype plugin indent on

"" Whitespace
set nowrap
set copyindent
set preserveindent
set tabstop=3 shiftwidth=3 softtabstop=0
set backspace=indent,eol,start

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

au BufRead /tmp/mutt-* set tw=72

