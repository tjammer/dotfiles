let g:python3_host_prog = '/usr/bin/python3'
if &compatible
set nocompatible endif
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
    call dein#begin(expand('~/.vim/dein'))

    call dein#add('Shougo/dein.vim', {'rtp':''})

    call dein#add('Valloric/YouCompleteMe', {'on_i': 1})
    call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
    call dein#add('ctrlpvim/ctrlp.vim', {'on_cmd': 'CtrlP'})
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('vim-syntastic/syntastic')

    call dein#add('itchyny/lightline.vim')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('MarcWeber/vim-addon-local-vimrc')
    call dein#add('alpertuna/vim-header')
    call dein#add('tjammer/blayu.vim')

    call dein#add('octol/vim-cpp-enhanced-highlight', 
                \{'on_ft': ['c', 'cpp']})
    call dein#add('rhysd/vim-clang-format',
                \{'on_ft': ['c', 'cpp']})
    call dein#add('drmikehenry/vim-headerguard',
                \{'on_ft': ['c', 'cpp']})

    call dein#add('lervag/vimtex',
                \{'on_ft': ['tex']})

    call dein#end()

    call dein#save_state()
endif

filetype plugin indent on
syntax enable

set mouse=a
set number
set relativenumber
set hlsearch

" ycm
 let g:ycm_autoclose_preview_window_after_completion=1
" nerdtree
nnoremap <c-t> :NERDTreeToggle<CR>
" ctrlp
let g:ctrlp_map = '<c-p>'
map <c-p> :CtrlP<CR>

set tabstop=4 |
set softtabstop=4 |
set shiftwidth=4 |
set expandtab |
set autoindent |
set fileformat=unix
set encoding=utf-8
set wildmenu
set showcmd

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,space:·
" set list!

let mapleader=","

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" colors
set termguicolors
colorscheme blayu
source ~/.vim/line.vim
let g:lightline.colorscheme = 'blayu'
set laststatus=2
set noshowmode

" cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" vim-header settings
let g:header_field_author = 'Tobias Jammer'
let g:header_field_author_email = 'tobiasjammer@gmail.com'
let g:header_auto_add_header = 0
let g:header_field_modified_by = 0
