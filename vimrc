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

Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'

Plugin 'ivanov/vim-ipython'

Bundle 'groenewege/vim-less'

Bundle 'davidhalter/jedi-vim'
"Bundle  'klen/python-mode'
Plugin 'ekalinin/Dockerfile.vim'

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

set grepprg=ack

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
colorscheme base16-ocean
"colorscheme base16-default
"colorscheme base16-mocha
"colorscheme base16-beard
syntax on
syntax enable

"let g:hybrid_use_Xresources = 1
"colorscheme gruvbox 
"let g:gruvbox_contrast_dark = 'hard'
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

filetype plugin on
filetype indent on
syntax on
"Discover text search object
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

"vim-airline config
"let g:airline_theme="gruvbox"
let g:airline_theme="jellybeans"
set laststatus=2

set nofoldenable

"Syntastic
"let g:syntastic_python_checkers = ['pylint']
"
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
