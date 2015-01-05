runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype plugin indent on
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

map <Leader>t :tabedit<CR>
map <Leader>d gt
map <Leader>s gT

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
" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <leader>k :<C-u>nohlsearch<CR><C-l>

set mouse=a
imap ii <C-[>
set scrolloff=5
set sidescrolloff=5
set backspace=indent,eol,start

set wildmode=longest,list,full
set wildmenu

let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '.beam$', '.class$']
map <Leader>n :NERDTreeToggle<CR>

"let g:syntastic_check_on_open = 1
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_auto_loc_list = 1

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

map <leader>, :tabedit $MYVIMRC<CR>

map <leader>q :wq<CR>
map <leader>w :w<CR>
" highlight trailing whitespace and hard tabs
set list listchars=tab:»·,trail:·


set cc=80

" Highlight characters behind the 80 chars margin
":au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)

"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff

highlight OverLength ctermbg=black ctermfg=darkcyan guibg=#592929
match OverLength /\%81v.\+/


" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
