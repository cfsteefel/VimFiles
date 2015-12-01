set term=xterm
filetype plugin indent on
syntax on
:set t_Co=256
:colo molokai
let g:rehash256 = 1
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set showmatch
set incsearch
set hlsearch
set mouse=a
cnoreabbrev Wq wq
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set cc=80
set listchars=tab:>-,trail:~
set list
autocmd BufWritePre * :%s/\s\+$//e
