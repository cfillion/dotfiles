set nocompatible
runtime macros/matchit.vim

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim/

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'sickill/vim-sunburst'

" addons
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ciaranm/detectindent'
Plugin 'godlygeek/tabular'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish' " CoeRcion
Plugin 'tpope/vim-characterize' " ga
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" languages
Plugin 'slim-template/vim-slim'
Plugin 'plasticboy/vim-markdown'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()

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
set listchars=tab:>-,nbsp:·
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
set wildchar=<Tab> wildmenu
set wildignore+=*.jpg
set wildignore+=*.midi,*.mp3,*.ogg
set wildignore+=*.o
set wildignore+=*.pdf
set wildignore+=.*
set wildignore+=_site,build,dist
set wildignore+=CMakeFiles,CMakeCache.txt,*.cmake
set wildignore+=*.aux,*.log
set wildignore+=tmp,node_modules,bower_components
set wildignore+=*.gem
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
au BufEnter    * setl makeprg=make
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
