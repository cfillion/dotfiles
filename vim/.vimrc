set nocompatible
runtime macros/matchit.vim

filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'ciaranm/detectindent'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'itchyny/lightline.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'sickill/vim-sunburst'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

let g:lightline = {'colorscheme': 'jellybeans'}
let g:vim_markdown_folding_disabled = 1
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10'

syntax on
color Sunburst

filetype plugin indent on
set autoindent
set backspace=2
set copyindent
set shiftround

cnoremap <C-g> <C-c>
command Wdiff :w !diff % -
map <Leader>a :Tab /
nnoremap <f11> mzggg?G`z
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap Y y$
noremap ; :
noremap <f9> :make!<CR>
vnoremap <silent> . :norm.<CR>

set autoread
set autowrite
set backupcopy=yes
set colorcolumn=81
set confirm
set directory=~/.vim/swap/,.
set encoding=utf-8
set foldlevelstart=20
set foldmethod=indent
set gdefault
set ignorecase
set incsearch
set laststatus=2
set linebreak
set list
set listchars=tab:>-
set mouse=a
set nohidden
set noshowmode
set nowrap
set number
set pastetoggle=<Ins>
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
set wildignore+=.*
set wildignore+=*.o
set wildignore+=*.midi,*.pdf
set wildignore+=*.mp3,*.jpg
set wildignore+=tmp,node_modules,bower_components
set wildignore+=_site,build,dist
set wildignorecase
set wrap

au BufRead /tmp/mutt-* set tw=80
au BufRead *.md set tw=80
au BufNewFile  * DetectIndent
au BufReadPost * DetectIndent
au VimEnter    * DetectIndent
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
au BufLeave    * if &modifiable | set noinsertmode | call OffInsert() | endif
au BufEnter    * checktime
au CursorHold  * checktime
au CursorHoldI * checktime
au InsertEnter * checktime
au InsertEnter * call OnInsert()
au InsertLeave * call OffInsert()
au TabEnter    * wincmd =
au VimResized  * wincmd =

au FileType lilypond setlocal commentstring=%%\ %s

function OnInsert()
  set norelativenumber cursorline nohlsearch
endfunction

function OffInsert()
  set relativenumber nocursorline hlsearch
endfunction
call OffInsert()
