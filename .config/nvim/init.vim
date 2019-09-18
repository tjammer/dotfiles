let g:python3_host_prog = '/usr/bin/python3'
if &compatible
set nocompatible endif
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.config/nvim/dein'))
    call dein#begin(expand('~/.config/nvim/dein'))

    call dein#add('Shougo/dein.vim', {'rtp':''})

    call dein#add('Shougo/deoplete.nvim', {'on_i': 1})
    call dein#add('autozimu/LanguageClient-neovim', {
    \ 'build': 'bash install.sh',
    \ })
    call dein#add('ctrlpvim/ctrlp.vim', {'on_cmd': 'CtrlP'})
    call dein#add('airblade/vim-gitgutter')
    call dein#add('w0rp/ale')

    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-sensible')
    call dein#add('tpope/vim-vinegar')
    call dein#add('tpope/vim-sleuth')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('MarcWeber/vim-addon-local-vimrc')

    " fluff
    call dein#add('vim-airline/vim-airline')
    call dein#add('tjammer/blayu.vim')
    call dein#add('tjammer/blandon.vim')
    call dein#add('ayu-theme/ayu-vim')
    call dein#add('rakr/vim-one')

    " languages
    call dein#add('sheerun/vim-polyglot')
    call dein#add('rhysd/vim-clang-format',
                \{'on_ft': ['c', 'cpp', 'glsl']})
    call dein#add('drmikehenry/vim-headerguard',
                \{'on_ft': ['c', 'cpp']})

    call dein#end()

    call dein#save_state()
endif

filetype plugin indent on
syntax enable

set mouse=a
set number
set relativenumber
set hlsearch

" ctrlp
let g:ctrlp_map = '<c-p>'
map <c-p> :CtrlP<CR>

set fileformat=unix
set ignorecase
set smartcase

set list

let mapleader=","

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

inoremap jj <esc>
vnoremap jj <esc>
onoremap jj <esc>

" colors
set termguicolors
colorscheme blandon
set noshowmode
let g:airline_theme = "blandon"
let g:airline_powerline_fonts = 1

"cursor
set guicursor=n-v-c:block-Cursor/Cursor,i-ci-ve:block-blinkon1-iCursor/iCursor

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#camel_case = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ALE
let g:ale_linters = {
\ 'cpp': ['clangd', 'clang-tidy'],
\}

" for commentary.vim
autocmd FileType c,cpp,java setlocal commentstring=//\ %s

" 
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'cpp': ['/usr/bin/clangd'],
    \ }

nnoremap <silent> <leader>i :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>g <c-w>v:call LanguageClient#textDocument_definition()<CR>

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" do not jump to last occurence on '#'
nnoremap # m`:keepjumps normal! #``<cr>

autocmd BufNewFile,BufRead *.sc set syntax=c
