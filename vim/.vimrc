let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Define plugins
call plug#begin()

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
call plug#end()

" Map the leader key to a comma
let mapleader = ','
let g:mapleader = ','

" Set line numbers
set number
" set relativenumber

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

" Key maps
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-d> <C-d>zz
map <C-u> <C-u>zz
inoremap jj <esc>
