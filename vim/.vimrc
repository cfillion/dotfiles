set nocompatible

filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'ciaranm/detectindent'
Bundle 'gmarik/vundle'
Bundle 'itchyny/lightline.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'plasticboy/vim-markdown'
Bundle 'Raimondi/delimitMate'
Bundle 'sickill/vim-sunburst'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:lightline = {'colorscheme': 'jellybeans'}
let g:vim_markdown_folding_disabled = 1

syntax on
color Sunburst

filetype plugin indent on
set autoindent
set backspace=2
set copyindent
set expandtab
set shiftround
set tabstop=2 sts=2 sw=2

command Wdiff :w !diff % -
cnoremap <C-g> <C-c>
nnoremap ; :
nnoremap <silent> <Leader>/ :nohlsearch<CR>
vnoremap <silent> . :norm.<CR>
nnoremap Y y$

set autoread
set backupcopy=yes
set colorcolumn=85
set confirm
set directory=~/.vim/swap/,.
set encoding=utf-8
set foldlevelstart=20
set foldmethod=indent
set gdefault
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set mouse=a
set noshowmode
set nowrap
set number
set pastetoggle=<Ins>
set relativenumber
set ruler
set scrolloff=3
set shortmess+=I
set showcmd
set smartcase
set splitbelow
set splitright
set ttimeoutlen=0
set undodir=~/.vim/undo/,.
set undofile
set updatetime=1000
set wildchar=<Tab> wildmenu wildmode=list
set wildignore=.*,*.o,tmp,node_modules
set wildignorecase
set wrap

au BufRead /tmp/mutt-* set tw=72
au BufReadPost * DetectIndent
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
au BufLeave    * if &modifiable | set noinsertmode | call OffInsert() | endif
au BufEnter    * checktime
au CursorHold  * checktime
au CursorHoldI * checktime
au InsertEnter * checktime
au InsertEnter * call OnInsert()
au InsertLeave * call OffInsert()

function OnInsert()
	set number norelativenumber cursorline nohlsearch
endfunction

function OffInsert()
	set number relativenumber nocursorline hlsearch
endfunction
