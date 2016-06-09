" Vundle settings and plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sensible'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-reload'
Plugin 'vim-scripts/vimwiki'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/Align'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/syntastic'
Plugin 'ajh17/VimCompletesMe'
Plugin 'ivanov/vim-ipython'
Plugin 'groenewege/vim-less'
Plugin 'davidhalter/jedi-vim'
Plugin 'chriskempson/base16-vim'
call vundle#end()
filetype plugin indent on

set noswapfile

"let mapleader = ","
let mapleader = "\<Space>"

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

noremap <Leader><Leader> V

noremap <Leader>w :w<CR> 
noremap <Leader>e :q!<CR>
vnoremap <Leader>s :sort<CR>

vnoremap < <gv
vnoremap > >gv

set modelines=0
set shell=/bin/sh
set directory=$HOME/.vim/tmp

set hi=1000

set visualbell

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"set grepprg=ack

set nojoinspaces

set shortmess+=I

set clipboard=unnamed

set hlsearch

set scrolloff=7


"let base16colorspace=256

"Colors and fonts
set t_Co=16
"set t_Co=256
set background=dark
colorscheme base16-railscasts
syntax on
syntax enable

"filetype plugin on
"filetype indent on

set colorcolumn=80
highlight ColorColumn ctermbg=233
set number
set ruler
set nowrap
set cursorline

"Added extensions for copy and paste to clipboard

function! SetColors()
    set background=dark
    highlight clear CursorLine
    highlight CursorLine term=underline cterm=underline
endfunction

au BufEnter * call SetColors()

"Show whitespace

"Source vimrc automatically once we save buffer

set pastetoggle=<F2>
set mouse=a
set bs=2


"map for saving and quitting and sorting
" Enter visual line mode with <Space><Space>
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smartindent
set backspace=eol,start,indent
set whichwrap+=<,>h,l

"highlighting 


"Discover text search object
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" setting up my own statusline
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"vim-airline config
"let g:airline_theme="gruvbox"
"let g:airline_theme="base16"
"set laststatus=2
set nofoldenable

"Syntastic
"let g:syntastic_python_checkers = ['pylint']
"
"better-whitespace 
function! StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s+$//e
        normal 'yz<CR>
        normal `z
    endif
endfunction

"Jedi-Vim
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_command = "<C-Space>"
map <Leader>b  import ipdb;ipdb.set_trace()

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

autocmd! bufwritepost .vimrc source %
