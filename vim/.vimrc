source /etc/vimrc

set nocompatible                " choose no compatibility with legacy vi
set t_Co=256
set number
set showcmd                     " display incomplete commands
set encoding=utf-8
set mouse=a

syntax on
color sunburst
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=3 shiftwidth=3      " a tab is two spaces (or set this to 4)
"set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
