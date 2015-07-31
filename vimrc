" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim, not Vi!
set nocompatible
"Required for Vundle
filetype off


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle "tpope/vim-sensible"

Bundle "gmarik/vundle"

Bundle "xolox/vim-misc"

Bundle "xolox/vim-reload"

Bundle "vim-scripts/vimwiki"

Bundle 'kien/ctrlp.vim'

Bundle 'vim-scripts/Align'

Bundle 'Lokaltog/vim-easymotion'

Bundle 'bling/vim-airline'

Bundle 'Valloric/YouCompleteMe'

Bundle 'groenewege/vim-less'


set noswapfile

let mapleader = ","

set modelines=0

set shell=/bin/sh


set directory=$HOME/.vim/tmp

set hi=1000

set visualbell

set grepprg=ack

set nojoinspaces

set shortmess+=I

set clipboard=unnamed

set hlsearch

set scrolloff=7

"Colors and fonts
set t_Co=256
syntax enable
let g:hybrid_use_Xresources = 1
set background=dark
color hybrid

set colorcolumn=85
highlight ColorColumn ctermbg=233
set number
set ruler
set nowrap
set cursorline

function! SetColors()
    set background=dark
    highlight clear CursorLine
    highlight CursorLine term=underline cterm=underline
endfunction

au BufEnter * call SetColors()

"Show whitespace

autocmd! bufwritepost .vimrc source %

set pastetoggle=<F2>
set mouse=a
set bs=2

let mapleader =","
let g:mapleader =","
"map for saving
noremap <leader>w :w!<cr>

noremap <Leader>e :q!<CR>

vnoremap <Leader>s :sort<CR>

vnoremap < <gv
vnoremap > >gv

set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smartindent
set backspace=eol,start,indent
set whichwrap+=<,>h,l

"vim-airline config
let g:airline_theme="bubblegum"
set laststatus=2
