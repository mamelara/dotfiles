set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
let g:hybrid_use_Xresources = 1

"Show whitespace
autocmd Colorscheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match Extrawhitespace /\s\+$/
color hybrid



autocmd! bufwritepost .vimrc source %

set pastetoggle=<F2>
set clipboard=unnamed

set mouse=a
set bs=2

let mapleader = ","

"Keys for saving
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

"Hot keys for quitting
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

vnoremap <Leader>s :sort<CR>

"Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv


set number
set tw=79
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

set ruler
set nowrap
set nocompatible

syntax on
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smartindent


map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT <C-c>

set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a.action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

set nofoldenable
