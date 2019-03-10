let g:python3_host_prog = '/usr/bin/python3'
if &compatible
set nocompatible endif
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.config/nvim/dein'))
    call dein#begin(expand('~/.config/nvim/dein'))

    call dein#add('Shougo/dein.vim', {'rtp':''})

    call dein#add('Shougo/deoplete.nvim', {'on_i': 1})
    call dein#add('deoplete-plugins/deoplete-clang', {'on_i': 1})
    call dein#add('scrooloose/nerdtree', {'on_cmd': 'NERDTreeToggle'})
    call dein#add('ctrlpvim/ctrlp.vim', {'on_cmd': 'CtrlP'})
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('w0rp/ale')

    call dein#add('vim-airline/vim-airline')
    call dein#add('tjammer/blayu.vim')
    call dein#add('tjammer/blandon.vim')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('MarcWeber/vim-addon-local-vimrc')

    call dein#add('octol/vim-cpp-enhanced-highlight',
                \{'on_ft': ['c', 'cpp']})
    call dein#add('rhysd/vim-clang-format',
                \{'on_ft': ['c', 'cpp', 'glsl']})
    call dein#add('drmikehenry/vim-headerguard',
                \{'on_ft': ['c', 'cpp']})
    call dein#add('sakhnik/nvim-gdb',
                \{'on_ft': ['c', 'cpp']})

    call dein#add('rust-lang/rust.vim',
                \{'on_ft': ['rust']})

    call dein#add('python-mode/python-mode',
                \{'on_ft': ['python']})

    call dein#add('lervag/vimtex',
                \{'on_ft': ['tex']})

    call dein#add('tikhomirov/vim-glsl',
                \{'on_ft': ['glsl']})

    call dein#add('calviken/vim-gdscript3',
                \{'on_ft': ['gdscript3']})

    call dein#end()

    call dein#save_state()
endif

filetype plugin indent on
syntax enable

set mouse=a
set number
set relativenumber
set hlsearch

" nerdtree
let g:NERDTreeMouseMode=2
nnoremap <c-t> :NERDTreeToggle<CR>
nnoremap <c-f> :NERDTreeFind<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'
map <c-p> :CtrlP<CR>

set tabstop=2 |
set softtabstop=2 |
set shiftwidth=2 |
set expandtab |
set autoindent |
set fileformat=unix
set encoding=utf-8
set ignorecase
set smartcase

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

" deoplete clang
let g:deoplete#sources#clang#libclang_path = expand("~/.config/nvim/clang/lib/libclang.so.7")
let g:deoplete#sources#clang#clang_header = expand("~/.config/nvim/clang/lib/clang")

" ALE
let g:ale_linters = {
\   'cpp': ['clangcheck', 'clangd', 'clangtidy', 'cppcheck'],
\}
map <leader>g :ALEGoToDefinitionInSplit<CR>
