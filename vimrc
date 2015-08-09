set nocompatible

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

"Bundle 'scrooloose/syntastic'
"Bundle 'Valloric/YouCompleteMe'

Bundle 'groenewege/vim-less'

"Bundle 'davidhalter/jedi-vim'
Bundle  'klen/python-mode'

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
let g:airline_theme="bubblegum"
set laststatus=2

set nofoldenable

"Syntastic
"let g:syntastic_python_checkers = ['flake8']
"
"Python - Mode
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pympde_syntax_builtin_funcs = 0

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


