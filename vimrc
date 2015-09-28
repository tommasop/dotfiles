set shell=/bin/sh
let mapleader = "\<Space>"

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set nobackup                    " no swap files
set nowritebackup
"Vim Plug configuration
call plug#begin('~/.vim/plugged')
" My Plugins here:
"
" original repos on github
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-fugitive'
Plug 'cakebaker/scss-syntax.vim'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'gabrielelana/vim-markdown'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plug 'vim-scripts/TwitVim'
Plug 'vim-scripts/DrawIt'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }

call plug#end()

set omnifunc=syntaxcomplete#Complete

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
"search with ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

" Color Scheme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
"let g:airline_enable_branch     = 1
"let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts = 1
set laststatus=2

" Open files with relative line numbers shown
set relativenumber

" Try to speed up vim horizontal scrolling
" set synmaxcol=128
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set clipboard=unnamed " to copy into global clipboard

" NERDTree to C-e
map <C-e> :NERDTreeToggle<CR>
" ##############################################################################                                                                         
" Easier split navigation                                                                                                                               
" ##############################################################################                                                                         
"
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>


" Leader mappings
nnoremap <Leader>w :w<CR> " save
" Copy and paste into clipboard
vmap <Leader>y "+y 
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" Enter in visual mode
nmap <Leader><Leader> V
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" clear search buffer when hitting return, so what you search for is not
" highlighted anymore. From Gary Bernhardt of Destroy All Software
nnoremap <CR> :nohlsearch<cr>
imap jk <esc>

" TwitVim
let twitvim_browser_cmd = 'open'
