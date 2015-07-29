set nocompatible
runtime macros/matchit.vim

filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim/
set runtimepath+=/usr/local/share/lilypond/*/vim/

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" addons
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'ciaranm/detectindent'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-abolish' " CoeRcion
Plugin 'tpope/vim-characterize' " ga
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" languages
Plugin 'dpwright/vim-tup'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'slim-template/vim-slim'

" color scheme
Plugin 'sickill/vim-sunburst'

call vundle#end()

syntax on
color Sunburst

filetype plugin indent on

let g:lightline = {'colorscheme': 'jellybeans'}
let g:vim_markdown_folding_disabled = 1
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10'

cnoremap <C-g> <C-c>
command Wdiff :w !diff % -
map <Leader>a :Tab /
nnoremap <f11> mzggg?G`z
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap Y y$
noremap ; :
noremap <f9> :make!<CR>
vnoremap <silent> . :norm.<CR>

set autoindent
set autoread
set autowrite
set background=dark
set backspace=2
set backupcopy=yes
set colorcolumn=81
set confirm
set copyindent
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
set shiftround
set shortmess+=I
set showcmd
set smartcase
set splitbelow
set splitright
set t_RV= ttymouse=xterm2
set t_ts=]0;
set title
set ttimeoutlen=0
set undodir=~/.vim/undo/,.
set undofile
set updatetime=1000
set wildchar=<Tab> wildmenu
set wildignore+=*.aux,*.log
set wildignore+=*.gem
set wildignore+=*.jpg
set wildignore+=*.midi,*.mp3,*.ogg
set wildignore+=*.o
set wildignore+=*.pdf
set wildignore+=.*
set wildignore+=_site,build,dist
set wildignore+=CMakeFiles,CMakeCache.txt,*.cmake
set wildignore+=tmp,node_modules,bower_components
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

function OnInsert()
  set norelativenumber cursorline nohlsearch
endfunction

function OffInsert()
  set relativenumber nocursorline hlsearch
endfunction
call OffInsert()

if filereadable(glob("~/.vim/vimrc_override"))
  source ~/.vim/vimrc_override
end
