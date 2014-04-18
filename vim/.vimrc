set nocompatible

filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'ciaranm/detectindent'
Bundle 'gmarik/vundle'
Bundle 'itchyny/lightline.vim'
Bundle 'junegunn/vim-easy-align'
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

cnoremap <C-g> <C-c>
command Wdiff :w !diff % -
map <Leader>a <Plug>(EasyAlign)
nnoremap <f11> mzggg?G`z
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap Y y$
noremap ; :
vnoremap <silent> . :norm.<CR>

set autoread
set backupcopy=yes
set colorcolumn=80
set confirm
set directory=~/.vim/swap/,.
set encoding=utf-8
set foldlevelstart=20
set foldmethod=indent
set gdefault
set nohidden
set ignorecase
set incsearch
set laststatus=2
set linebreak
set mouse=a
set noshowmode
set nowrap
set number
set pastetoggle=<Ins>
set ruler
set list
set listchars=tab:>-
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
set wildignore=.*
set wildignore+=*.o
set wildignore+=*.midi,*.pdf
set wildignore+=tmp,node_modules
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
au VimResized  * wincmd =

au FileType lilypond setlocal commentstring=%%\ %s

function OnInsert()
  set norelativenumber cursorline nohlsearch
endfunction

function OffInsert()
  set relativenumber nocursorline hlsearch
endfunction
call OffInsert()
