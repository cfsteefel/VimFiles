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
Plugin 'https://github.com/wincent/command-t.git'

" YCM plugin
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
" YCM configuration generator
Plugin 'rdnetto/YCM-Generator'

"Plugin for compiling Tex documents
Plugin 'lervag/vimtex'

"Provides syntax highlighting for various languages
Plugin 'https://github.com/sheerun/vim-polyglot.git'

Plugin 'OCamlPro/ocp-indent'

" Provides a bottom bar with info
Plugin 'vim-airline/vim-airline'

"Color scheme
Plugin 'tomasr/molokai'

Plugin 'KeitaNakamura/neodark.vim'

Plugin 'lu-ren/SerialExperimentsLain'



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
let g:neodark#use_256color = 1
set t_Co=256
colo neodark
"}}}
"Indents and tab edits"{{{
" Set up autoindenting and syntax coloring
syntax on
" Convert tabs to two spaces
set smartindent
set shiftwidth=2
set softtabstop=2
set expandtab
set listchars=tab:>-,trail:~
set list
"}}}
" Show line numbers"{{{
set number
"}}}
" search settings"{{{
set showmatch
set incsearch
set hlsearch"}}}
" Enable the mouse"{{{
set mouse=a
"}}}
" 80 Character edits"{{{
" Highlight characters past 80 characters in red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
" Create a color column in the 80th column, useful for python
set cc=80
highlight ColorColumn ctermbg=Red
"}}}
"Plugin options"{{{
let g:CommandTFileScanner="find"
let g:CommandTSuppressMaxFilesWarning=1
set wildignore+=*.o,*.class,.git,AndroidStudioProjects/MyApp/**,*.dSYM/**
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_extra_conf_globlist=['*', '']
nnoremap <leader>f :YcmCompleter FixIt<CR>
"}}}
"Key remappings"{{{
let maplocalleader='\\'
let mapleader=','
nnoremap j gj
nnoremap k gk
cnoreabbrev qq qall
cnoreabbrev Wq wq
"}}}
" Random settings"{{{
set ff=unix
set showcmd
set laststatus=2
set wildmenu
autocmd  BufWritePre *.{java,c,cpp,python,ml,hpp,h} :retab
autocmd BufWritePre *.{java,c,cpp,python,ml,hpp,h} %s/\s\+$//e
set encoding=utf-8
set backspace=2
set tabpagemax=100

au BufNewFile,BufRead *.RESULT set filetype=RESULT
if has("mouse")
  set mouse=a
endif
"}}}
"Ocaml Settings "{{{
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
"}}}
