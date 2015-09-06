set nocompatible

filetype off


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle 'tpope/vim-rails'

Bundle "tpope/vim-sensible"

Bundle "gmarik/vundle"

Bundle "xolox/vim-misc"

Bundle "xolox/vim-reload"

Bundle "vim-scripts/vimwiki"

Bundle 'kien/ctrlp.vim'

Bundle 'vim-scripts/Align'

Bundle 'Lokaltog/vim-easymotion'

Bundle 'bling/vim-airline'

Plugin 'morhetz/gruvbox'

Plugin 'nvie/vim-flake8'
"Bundle 'scrooloose/syntastic'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'ivanov/vim-ipython'
Bundle 'groenewege/vim-less'

Bundle 'davidhalter/jedi-vim'
"Bundle  'klen/python-mode'

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
"let g:hybrid_use_Xresources = 1
set background=dark
colorscheme gruvbox 

set colorcolumn=85
highlight ColorColumn ctermbg=233
set number
set ruler
set nowrap
set cursorline

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


function! SetColors()
    set background=dark
    highlight clear CursorLine
    highlight CursorLine term=underline cterm=underline
endfunction

au BufEnter * call SetColors()

"Show whitespace

"Source vimrc automatically once we save buffer
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

filetype plugin on
filetype indent on
syntax on

"vim-airline config
let g:airline_theme="gruvbox"
set laststatus=2

set nofoldenable

"Syntastic
"let g:syntastic_python_checkers = ['flake8']
"
"Jedi-Vim
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b import ipdb;ipdb.set_trace()

"Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/
set wildignore+=*/coverage/*


function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

