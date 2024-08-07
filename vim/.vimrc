let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Python
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" Define plugins
call plug#begin()

" Test
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'

" Comment
Plug 'tpope/vim-commentary'

" Common options
Plug 'tpope/vim-sensible'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Colorscheme
Plug 'NLKNguyen/papercolor-theme'

" Statusline
Plug 'vim-airline/vim-airline'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'tmhedberg/SimpylFold'

call plug#end()

" Map the leader key to a comma
let mapleader = ' '
let g:mapleader = ' '

" Set line numbers
set number
set relativenumber

" Configure indent with spaces
syntax on
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cursorline

" Do not keep a backup file
set nobackup

" Enable folding
set foldmethod=indent
set foldlevel=99

" Disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Better search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Set colorscheme
try
	set t_Co=256
	set background=dark
	colorscheme PaperColor
catch /^Vim\%((\a\+)\)\=:E185/
  " Colorscheme is not installed
  " Try again later
endtry

" Enable git gutter
set updatetime=100
set signcolumn=yes

" Disable startup page
set shortmess=I

" Set Scrolloff
set scrolloff=15

" Key maps
" Enable folding with the spacebar
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-d> <C-d>zz
map <C-u> <C-u>zz

" Enable folding with the spacebar
nnoremap <space> za

" Paste to register
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" better up/down
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
xnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> <Down> (v:count == 0 ? 'gj' : 'j')
xnoremap <expr> <Down> (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
xnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> <Up> (v:count == 0 ? 'gk' : 'k')
xnoremap <expr> <Up> (v:count == 0 ? 'gk' : 'k')

" better indenting
vnoremap < <gv
vnoremap > >gv

" save file
nnoremap <C-s> :w<cr><esc>
xnoremap <C-s> :w<cr><esc>
inoremap <C-s> <esc>:w<cr><esc>
snoremap <C-s> <esc>:w<cr><esc>

inoremap . .<c-g>u
inoremap ; ;<c-g>u

" Move lines up and down
nnoremap <A-j> :m .+1<cr>==
nnoremap <A-k> :m .-2<cr>==
inoremap <A-j> <esc>:m .+1<cr>==gi
inoremap <A-k> <esc>:m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv
