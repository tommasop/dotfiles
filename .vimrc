set shell=/bin/sh

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set nobackup                    " no swap files
set wildmenu
set nowritebackup
"Vim Plug autoload
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Vim Plug configuration
call plug#begin('~/.vim/plugged')

" ================= Functionalities ================= "
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'kyazdani42/nvim-web-devicons' " for file icons
"Plug 'kyazdani42/nvim-tree.lua'
"Plug 'onsails/lspkind-nvim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'desmap/ale-sensible' | Plug 'w0rp/ale'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'mileszs/ack.vim'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'AndrewRadev/splitjoin.vim'

" ================= Aestethics ================= "
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" ================= Git ================= "
Plug 'tpope/vim-fugitive'
" Gbrowse for bitbucket
Plug 'tommcdo/vim-fubitive'
Plug 'airblade/vim-gitgutter'
Plug 'stsewd/fzf-checkout.vim'

" ================= Languages ================= "
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'plasticboy/vim-markdown'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'slim-template/vim-slim'
Plug 'slime-lang/vim-slime-syntax'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'

" ================= Other Stuff ================= "
Plug 'n0v1c3/vira', { 'do': './install.sh' }
Plug 'vim-scripts/TwitVim'

call plug#end()

" ================= General Config ================= "

set nowrap                                              " don't wrap lines
set tabstop=2 shiftwidth=2                              " a tab is two spaces (or set this to 4)
set expandtab                                           " use spaces, not tabs (optional)
set backspace=indent,eol,start                          " backspace through everything in insert mode
set hlsearch                                            " highlight matches
set incsearch                                           " incremental searching
set ignorecase                                          " searches are case insensitive...
set smartcase                                           " ... unless they contain at least one capital letter
set encoding=utf-8                                      " text encoding
set number                                              " enable numbers on the left
set relativenumber                                      " current line is 0
set title                                               " tab title as file name
set mouse=a                                             " enable mouse scrolling

" Use clipboard as default register
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

set tabstop=4 softtabstop=4 shiftwidth=4 autoindent     " tab width
set expandtab smarttab                                  " tab key actions

" For any plugins that use this, make their keymappings use comma
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","

syntax on
set t_Co=256
set cursorline
set background=dark
colorscheme dracula

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set noshowmode
set laststatus=2

" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

" use system ruby for nvim instead of per project ruby
" let g:ruby_host_prog = '/home/tommasop/.asdf/installs/ruby/2.7.2/bin/neovim-ruby-host'
" let g:node_host_prog = '/home/tommasop/.asdf/installs/nodejs/14.6.0/.npm/bin/neovim-node-host'

" ======================== Plugin Configurations ======================== "

"" coc

" Navigate snippet placeholders using tab
"let g:coc_snippet_next = '<Tab>'
"let g:coc_snippet_prev = '<S-Tab>'
"
" list of the extensions to make sure are always installed
"let g:coc_global_extensions = [
"            \'coc-yank',
"            \'coc-pairs',
"            \'coc-json',
"            \'coc-actions',
"            \'coc-css',
"            \'coc-html',
"            \'coc-tsserver',
"            \'coc-yaml',
"            \'coc-lists',
"            \'coc-snippets',
"            \'coc-pyright',
"            \'coc-clangd',
"            \'coc-prettier',
"            \'coc-xml',
"            \'coc-syntax',
"            \'coc-git',
"            \'coc-marketplace',
"            \'coc-highlight',
"            \'coc-flutter',
"            \'coc-explorer',
"            \'coc-solargraph',
"            \'coc-vetur',
"            \'coc-go',
"            \]
" try to set root patterns for pyright
"autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']
"
"let g:rg_derive_root='true'

lua << EOF
require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
local servers = { 'pyright', 'tsserver', 'solargraph', 'sorbet', 'elixirls' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
  }
end
EOF

"" fzf 
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

nmap ; :FzfBuffers<CR>
nnoremap \ :FzFRG<CR>
nmap <Leader>a :FzfAg<CR>
nmap <Leader>r :FzfTags<CR>
nmap <Leader>t :FzfFiles<CR>
nmap <Leader>g :FzfGFiles<CR>

" fzf color scheme updater from https://github.com/junegunn/fzf.vim/issues/59
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

"" autocomplete with fzf
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

"" fzf-checkout
let g:fzf_command_prefix = 'Fzf'
let g:fzf_checkout_git_options = '--sort=-committerdate'
let g:fzf_tag_actions = {
      \ 'checkout': {'execute': '!{git} checkout {branch}'},
      \}

" advanced ripgrep fzf delegates to ripgrep
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --ignore-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang FzFRG call RipgrepFzf(<q-args>, <bang>0)

"" ale

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

"" lightline

let g:lightline = {
  \ 'colorscheme': 'dracula',
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

"" git gutter column

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
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
endif

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
" Enter in visual mode
nmap <Leader><Leader> V
nmap <Leader>f :let @+ = expand("%")<CR>
imap jk <esc>

" clear search buffer when hitting return, so what you search for is not
" highlighted anymore. From Gary Bernhardt of Destroy All Software
nnoremap <CR> :nohlsearch<cr>
" switch to alternate buffer
nnoremap <Space><Space> <C-^>
" toggle lint in file
nnoremap <leader>' :ALEToggle<CR>

"" TwitVim
let twitvim_browser_cmd = 'open'

"" elixir mix format
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

" fugitive Conflict Resolution
let g:fugitive_domain_pattern = 'binarysystem\.atlassian\.net'
nnoremap <leader>gd :Gvdiff<CR>
nmap <leader>gb :Gblame<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

nnoremap <silent> <PageUp> <C-U>
vnoremap <silent> <PageUp> <C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D>
vnoremap <silent> <PageDown> <C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D>
