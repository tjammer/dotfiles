set nocompatible              " required
filetype off                  " required
let s:editor_root=expand("~/.config/nvim")

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" " Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)
Plugin 'lyuts/vim-rtags'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'w0rp/ale'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tikhomirov/vim-glsl'
Plugin 'dcharbon/vim-flatbuffers'
Plugin 'rhysd/vim-clang-format'
Plugin 'kien/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'rust-lang/rust.vim'
Plugin 'lervag/vimtex'
" nicer things
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'drmikehenry/vim-headerguard'
Plugin 'tmhedberg/SimpylFold'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Valloric/ListToggle'
" themes
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'dracula/vim'
Plugin 'nightsense/seabird'

"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set termguicolors

"split navigations
 nnoremap <C-J> <C-W><C-J>
 nnoremap <C-K> <C-W><C-K>
 nnoremap <C-L> <C-W><C-L>
 nnoremap <C-H> <C-W><C-H>

 nmap <c-c> <esc>
 imap <c-c> <esc>
 vmap <c-c> <esc>
 omap <c-c> <esc>

set tabstop=2 |
set softtabstop=2 |
set shiftwidth=2 |
"set textwidth=79 |
set expandtab |
set autoindent |
set fileformat=unix
set foldlevel=99

 highlight BadWhitespace ctermbg=red guibg=darkred
 au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
 au BufReadPost *.glsl set syntax=glsl
 au FileType python setl sw=4 sts=4 shiftwidth=4 et

 set encoding=utf-8

 let mapleader=","
 let g:ycm_autoclose_preview_window_after_completion=1
 map <leader>g  :YcmCompleter GoTo<CR>
 map <leader>t : YcmCompleter GetType<CR>
 map <leader>f : YcmCompleter FixIt<CR>
 map <leader>d :YcmCompleter GoToDefinition<CR>
 nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
 nnoremap <leader>e :YcmForceCompileAndDiagnostics<CR>

let python_highlight_all=1
syntax on
set nu
set mouse=a

"nerdtree toggle
nnoremap <c-t> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']

" colors
set background=dark
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active':  {
		    \ 'left': [ [ 'mode', 'paste' ],
		    \           [ 'readonly', 'filename', 'modified', 'gitbranch' ] ] },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
      \ }
set laststatus=2
colorscheme dracula

let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
set nohlsearch

" spaces
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,space:·
"set list!

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//