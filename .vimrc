setlocal foldmethod=marker
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
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'https://github.com/Valloric/YouCompleteMe.git'

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
set mouse=a"}}}
" make Wq equivalent to wq for convenience"{{{
cnoreabbrev Wq wq"}}}
" 80 Character edits"{{{
" Highlight characters past 80 characters in red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
" Create a color column in the 80th column, useful for python
set cc=80"}}}
" Show tabs as >--, and show trailing whitespace as ~"{{{
set listchars=tab:>-,trail:~
set list"}}}
" Delete trailing whitespace"{{{
autocmd BufWritePre * :%s/\s\+$//e"}}}
" File header Macro""{{{
" = creates fileHeading (modified version)
function FileHeading()
  let s:line=line(".")
  call setline(s:line,   "/*")
  call append (s:line,   " * Author: Christoph Steefel")
  call append (s:line+1, " * Filename:        ".expand("%"))
  call append (s:line+2, " * Date: ".strftime("%b-%d-%Y"))
  call append (s:line+3, " * Description:     TODO")
  call append (s:line+4, " */")
  unlet s:line
endfunction
"
imap <F4> <ESC>mz:execute FileHeading()<CR>`z4jA"}}}
" Function for C style function headers"{{{
function CFuncHeading()
  let s:line=getline(".")
  let s:type=split(split(s:line, "(")[0])[0]
  let s:name=split(split(s:line, "(")[0])[1]
  let s:args=split(split(split(s:line, "(")[1], ")")[0], ",")
  normal O<ESC>k
  let s:newline=line(".")
  let s:i = 0
  call setline(s:newline, "/*")
  call append (s:newline+s:i, " * Function name: " . s:name . "()")
  let s:i += 1
  call append (s:newline+s:i, " * Function prototype: " . split(s:line, "{")[0])
  unlet s:line
  let s:i += 1
  call append (s:newline+s:i, " * Description:  TODO")
  let s:i += 1
  call append (s:newline+s:i, " * Arguments:")
  let s:i += 1
  for arg in s:args
    let s:temp = substitute(arg, '^\s*\(.\{-}\)\s*$', '\1', '')
    call append(s:newline+s:i, " *\t\t" . s:temp  . " - ")
    let s:i += 1
  endfor
  unlet s:args
  call append (s:newline+s:i, " * Side Effects: TODO")
  let s:i += 1
  call append (s:newline+s:i, " * Error Conditions: TODO")
  let s:i += 1
  call append(s:newline+s:i, " * Returns - type " . s:type . ": ")
  let s:i += 1
  unlet s:type
  call append(s:newline+s:i, " */")
  unlet s:name
  unlet s:i
  unlet s:newline
endfunction

imap <F3> <ESC>mz:execute CFuncHeading()<CR>`zA
"}}}



