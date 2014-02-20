set nocompatible

if (match(system("uname -s"), "FreeBSD") != -1)
    set term=builtin_xterm
else
    set term=color_xterm
endif
set term=color_xterm
syntax on
set softtabstop=4
set shiftwidth=4
set cindent expandtab
set number
set ruler
set hlsearch incsearch ignorecase smartcase
set mouse=a
set wildmenu
set wildmode=list:longest
imap ii <C-[>
set scrolloff=5
set sidescrolloff=5
