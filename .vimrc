runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype plugin on
execute pathogen#infect()
set nocompatible

if (match(system("uname -s"), "Darwin") != -1)
    "set term=color_xterm
    map <D-S-]> gt
    map <D-S-[> gT
else
    "set term=builtin_xterm
    map <C-S-]> gt
    map <C-S-[> gT
endif

syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<leader>l")

set encoding=utf-8
set softtabstop=4
set shiftwidth=4
set cindent expandtab
set number
set ruler
set hlsearch incsearch ignorecase smartcase
set mouse=a
imap ii <C-[>
set scrolloff=5
set sidescrolloff=5
set backspace=indent,eol,start 

set wildmode=longest,list,full
set wildmenu

let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '.beam$', '.class$']
map <Leader>n :NERDTreeToggle<CR>

let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

map <leader>, :tabedit $MYVIMRC<CR>

set cc=80

"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff

highlight OverLength ctermbg=black ctermfg=darkcyan guibg=#592929
match OverLength /\%81v.\+/

"match ErrorMsg '\%>80v.\+'

"inoremap { {}<Esc>i
"inoremap [ []<Esc>i
"inoremap < <><Esc>i
"inoremap ( ()<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i
