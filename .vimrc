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

" Provides a bottom bar with info
Plugin 'vim-airline/vim-airline'

"Color scheme
Plugin 'mhartington/oceanic-next'

Plugin 'tomasr/molokai'

Plugin 'KeitaNakamura/neodark.vim'

" Code formatting tools
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-fugitive.git'
Plugin 'airblade/vim-gitgutter.git'

Plugin 'w0rp/ale'

" Has to be after ocp-indent, to not mess up indentation
" Plugin 'https://github.com/sheerun/vim-polyglot'

Plugin 'vim-scripts/LargeFile'

if has('nvim')
   Plugin 'nvim-treesitter/nvim-treesitter'
   Plugin 'Shougo/deoplete.nvim'
   Plugin 'nvim-lua/plenary.nvim'
   Plugin 'nvim-telescope/telescope.nvim'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
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
" for vim 8
set termguicolors
let g:solarized_termtrans=1
set t_Co=256
set t_ut=
colo neodark
let g:rehash256 = 1
let g:neodark#use_256color = 1

"}}}
"Indents and tab edits"{{{
" Set up autoindenting and syntax coloring
syntax on
" Convert tabs to two spaces
set smartindent
set shiftwidth=3
set softtabstop=3
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
set hlsearch
set ignorecase
set smartcase
"}}}
" Enable the mouse"{{{
set mouse=a
if has("mouse_sgr")
 set ttymouse=sgr
else
   if !has('nvim')
      set ttymouse=xterm2
   endif
endif
"}}}
" 85 Character edits"{{{
" Highlight characters past 85 characters in red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%86v.\+/
" Create a color column in the 85th column
set cc=85
"}}}
"Key remappings"{{{
let maplocalleader='\\'
let mapleader=','
nnoremap j gj
nnoremap k gk
cnoreabbrev qq qall
cnoreabbrev Wq wq
cnoreabbrev W w
nmap <esc>OA <Up>
nmap <esc>OB <Down>
nmap <esc>OC <Right>
nmap <esc>OD <Left>
"}}}
" Code formatting"{{{
call glaive#Install()
nnoremap <leader>fc <cmd>FormatCode<cr>
vnoremap <leader>fl <cmd>FormatLines<cr>
nnoremap <leader>d <cmd>ALEDetail<cr>
" Glaive codefmt autopep8_executable="autopep8"
"}}}
" Random settings"{{{
set ff=unix
set showcmd
set laststatus=2
set cursorline
set wildmenu
set encoding=utf-8
set backspace=2
set tabpagemax=100
set scrolloff=5
set wildignore+=*.o
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_completion_delay = 500
if has('nvim')
   let g:deoplete#enable_at_startup = 1
   call deoplete#custom#option('sources', {
   \ '_': ['ale'],
   \ 'auto_complete_delay': 500,
   \ 'max_list': 20,
   \ 'num_processes': 0,
   \ 'on_insert_enter': v:false,
   \ 'yarp': v:true,
   \})
endif
let g:silentGoFormatting = 1

"}}}
" Misc commands {{{
command Json :%!python -m json.tool

"}}}
"nvim-treesitter config{{{
if has('nvim')
   lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { 'godotResource', 'gdscript', 'teal' }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled 
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
" Disable folding, as it doesn't actually work that nicely with tree-sitter
" (has knock-on effects)
" set foldenable
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
" set foldlevel=2
set formatexpr=glaive#FormatLines()
endif

let g:LargeFile=10

"}}}
" Telescope mappings{{{
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" vim: foldmethod=marker
