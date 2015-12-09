" Set the terminal to X_term, and change the color to be 256 colors, so that
" molokai works.
set term=xterm
:set t_Co=256
:colo molokai
let g:rehash256 = 1
" Set up autindenting and syntax coloring
filetype plugin indent on
syntax on
" Convert tabs to two spaces
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
" Show line numbers
set number
" search settings
set showmatch
set incsearch
set hlsearch
" Enable the mouse
set mouse=a
" make Wq equivalent to wq for convenience
cnoreabbrev Wq wq
" Highlight characters past 80 characters in red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
" Create a color column in the 80th column, useful for python
set cc=80
" Show tabs as >--, and show trailing whitespace as ~
set listchars=tab:>-,trail:~
set list
" Delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
