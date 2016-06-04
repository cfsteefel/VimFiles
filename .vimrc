" Name: .vimrc
" Author: Christoph Steefel
" Created with help from Aniket Mathur, the interwebs.
set foldmethod=marker
set foldenable
" Vundle information"{{{
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

Plugin 'https://github.com/Valloric/YouCompleteMe.git'

Plugin 'lervag/vimtex'

Plugin 'https://github.com/sheerun/vim-polyglot.git'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line"}}}
" Colorscheme"{{{
" Set the terminal to X_term, and change the color to be 256 colors, so that
" molokai works.
set term=xterm
let g:rehash256 = 1
set t_Co=256
colo molokai"}}}
"Indents and tab edits"{{{
" Set up autindenting and syntax coloring
filetype plugin indent on
syntax on
" Convert tabs to two spaces
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab"}}}
" Show line numbers"{{{
set number"}}}
" search settings"{{{
set showmatch
set incsearch
set hlsearch"}}}
" Enable the mouse"{{{
set mouse=a
"}}}
" make Wq equivalent to wq for convenience"{{{
cnoreabbrev Wq wq
"}}}
" 80 Character edits"{{{
" Highlight characters past 80 characters in red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
" Create a color column in the 80th column, useful for python
set cc=80"}}}
" Show tabs as >--, and show trailing whitespace as ~"{{{
set listchars=tab:>-,trail:~
set list"}}}


let maplocalleader='\\'
let mapleader=','
