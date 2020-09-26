set shell=/bin/sh

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set nobackup                    " no swap files
set nowritebackup
"Vim Plug autoload
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Vim Plug configuration
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'itchyny/lightline.vim'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-fugitive'
Plug 'cakebaker/scss-syntax.vim'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'plasticboy/vim-markdown'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/TwitVim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'desmap/ale-sensible' | Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'slim-template/vim-slim'
Plug 'slime-lang/vim-slime-syntax'
Plug 'isRuslan/vim-es6'
" Plug 'ajh17/VimCompletesMe'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'lambdalisue/suda.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'samoshkin/vim-mergetool'
call plug#end()

" set omnifunc=syntaxcomplete#Complete

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
" For any plugins that use this, make their keymappings use comma
let mapleader = ","
let maplocalleader = ","

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>a :Ag<CR>

" FZF color scheme updater from https://github.com/junegunn/fzf.vim/issues/59
function! s:update_fzf_colors()
  let rules =
        \ { 'fg':      [['Normal',       'fg']],
        \ 'bg':      [['Normal',       'bg']],
        \ 'hl':      [['String',       'fg']],
        \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
        \ 'bg+':     [['CursorColumn', 'bg']],
        \ 'hl+':     [['String',       'fg']],
        \ 'info':    [['PreProc',      'fg']],
        \ 'prompt':  [['Conditional',  'fg']],
        \ 'pointer': [['Exception',    'fg']],
        \ 'marker':  [['Keyword',      'fg']],
        \ 'spinner': [['Label',        'fg']],
        \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code != ''
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ (empty(cols) ? '' : (' --color='.join(cols, ',')))
endfunction

augroup _fzf
  autocmd!
  autocmd VimEnter,ColorScheme * call <sid>update_fzf_colors()
augroup END

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" Autocomplete with fzf
function! s:fzf_insert(data)
  execute 'normal!' (empty(s:fzf_query) ? 'a' : 'ciW')."\<C-R>=a:data\<CR>"
  startinsert!
endfunction

function! s:fzf_words(query)
  let s:fzf_query = a:query
  let matches = fzf#run({
        \ 'source':  'cat /usr/share/dict/words',
        \ 'sink':    function('s:fzf_insert'),
        \ 'options': '--no-multi --query="'.escape(a:query, '"').'"',
        \ 'down':    '40%'
        \ })
endfunction

inoremap <silent> <C-X><C-W> <C-o>:call <SID>fzf_words(expand('<cWORD>'))<CR>

" ALE
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_warnings = l:counts.total - l:all_errors

    let l:errors_recap = l:all_errors == 0 ? '' : printf('%d⨉ ', all_errors)
    let l:warnings_recap = l:all_warnings == 0 ? '' : printf('%d⚠ ', all_warnings)
    return (errors_recap . warnings_recap)
endfunction

set statusline+=%=
set statusline+=\ %{LinterStatus()}

let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

nmap ]l :ALENextWrap<CR>
nmap [l :ALEPreviousWrap<CR>

" NEOFORMAT
" Enable alignment
" let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
" let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
" let g:neoformat_basic_format_trim = 1
" let g:neoformat_enabled_ruby = ['rubocop']
" augroup fmt
"  autocmd!
"  autocmd BufWritePre * undojoin | Neoformat
" augroup END
" To run manually
" nnoremap <leader>fm :Neoformat<CR>

" Lightline
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['filename', 'modified']],
  \   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
  \ },
  \ 'component_expand': {
  \   'linter_warnings': 'LightlineLinterWarnings',
  \   'linter_errors': 'LightlineLinterErrors',
  \   'linter_ok': 'LightlineLinterOK'
  \ },
  \ 'component_type': {
  \   'readonly': 'error',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error'
  \ },
  \ 'component_function': {
  \   'filename': 'LightLineFilename'
  \ },
  \ }
function! LightLineFilename()
  return expand('%')
endfunction
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" ----------------------------------------------------------------------------
" COLORS
" ----------------------------------------------------------------------------
" Make sure colored syntax mode is on, and make it Just Work with 256-color terminals.
" let g:rehash256 = 1
syntax enable
set background=dark
set t_Co=256
colorscheme solarized
set noshowmode
set laststatus=2

" Git Gutter column
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
highlight GitGutterAdd guifg=green
highlight GitGutterChange guifg=yellow
highlight GitGutterDelete guifg=red
highlight GitGutterChangeDelete guifg=yellow

" Open files with hybrid line numbering
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

if !has('nvim')
  " Try to speed up vim horizontal scrolling
  " set synmaxcol=128
  set ttyfast " u got a fast terminal
  set ttyscroll=3
  set lazyredraw " to avoid scrolling problems
endif

if has('nvim')
  let g:python_host_prog = '/home/linuxbrew/.linuxbrew/bin/python'
  let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
endif

set clipboard+=unnamedplus

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
nnoremap <Leader>w :w<CR>
" Copy and paste into clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
" Enter in visual mode
nmap <Leader><Leader> V

imap jk <esc>

" clear search buffer when hitting return, so what you search for is not
" highlighted anymore. From Gary Bernhardt of Destroy All Software
nnoremap <CR> :nohlsearch<cr>
" switch to alternate buffer
nnoremap <Space><Space> <C-^>
" yank to system clipboard
nnoremap <leader>y "+y
" toggle lint in file
nnoremap <leader>' ALEToggle

" TwitVim
let twitvim_browser_cmd = 'open'

"Elixir mix format
let g:mix_format_on_save = 1

" Vim Test
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

nnoremap <silent> <PageUp> <C-U>
vnoremap <silent> <PageUp> <C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D>
vnoremap <silent> <PageDown> <C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D>
