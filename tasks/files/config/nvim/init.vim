" General Options {
  let mapleader=","
  filetype off
  set encoding=utf-8
  set history=1000
  set mouse=a
  set number 
  set relativenumber
  set autoread

  " copy to clipboard
  set clipboard+=unnamedplus
" }

call plug#begin()

" General Plugins {
  " Autocomplete
  Plug 'alvan/vim-closetag'
  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
  Plug 'Shougo/deoplete-clangx'
  Plug 'Shougo/neoinclude.vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'deoplete-plugins/deoplete-jedi'
  " Code formater
  Plug 'sbdchd/neoformat'
  " Colors
  Plug 'chrisbra/Colorizer'
  " Format tables
  Plug 'godlygeek/tabular'
  " Fuzzy finder
  Plug 'ctrlpvim/ctrlp.vim'
  " Git integration
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  " Manipulation of surraunding parents, quotes, etc.
  Plug 'tpope/vim-surround'
  " Navigation
  Plug 'scrooloose/nerdtree'
  " Search and replace plugin
  Plug 'brooth/far.vim'
  " Snippets
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  " Syntaxe checking on save
  Plug 'neomake/neomake'
  " Tagbar
  Plug 'majutsushi/tagbar'
  " Varnish
  Plug 'smerrill/vcl-vim-plugin'
  " Window
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
" }

" API Rest Plugins {
  Plug 'diepm/vim-rest-console'
  Plug 'xavierchow/vim-swagger-preview'
" }

" CPlugins {
  Plug 'vim-scripts/c.vim'
" }

" GolangPlugins {
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" }

" JavaPlugins {
  Plug 'artur-shaik/vim-javacomplete2'
" }

" PythonPlugins {
  Plug 'vim-scripts/indentpython.vim'
  Plug 'nvie/vim-flake8'
  Plug 'tell-k/vim-autopep8'
" }

" JavaPlugins {
  Plug 'rust-lang/rust.vim'
" }

" RubyPlugins {
  Plug 'tpope/vim-rvm'
  Plug 'ngmy/vim-rubocop'
" }

" Theme Plugins {
  Plug 'altercation/vim-colors-solarized'
  Plug 'jdsimcoe/abstract.vim'
  Plug 'aonemd/kuroi.vim'
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'christophermca/meta5'
  Plug 'tomasr/molokai'
" }
call plug#end()

" Filetype Options {
  filetype plugin indent on
  syntax enable
" }

" Default Options {
  set tabstop=2 " Tabs are 2 spaces
  set backspace=2 " Backspace deletes 2 spaces
  set shiftwidth=2 " Even if there are tabs, preview as 2 spaces
  set textwidth=80  " Switch line at 80 characters
  set showmatch     " Show matching of: () [] {}
  set scrolloff=5   " Keep some distance to the bottom"
  set ignorecase    " Required for smartcase to work
  set smartcase     " Case sensitive when uppercase is present
  set incsearch     " Search as you type
  set smartindent   " Be smart about indentation
  set expandtab     " Tabs are spaces
  set smarttab
  set cursorline
  set cursorcolumn

  set wildignore+=.git/** 
" }

" Deoplete Options {
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#omni_patterns = {}
  let g:deoplete#sources = {}
  let g:deoplete#sources._ = []
  let g:deoplete#file#enable_buffer_path = 1
" }

" Neomake Options {
  autocmd! BufWritePost,BufEnter * Neomake
" }

" Neoformat Options {
  augroup astyle
    autocmd!
    autocmd BufWritePre * Neoformat
  augroup END
" }

" Neosnippet Options {
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  
  " SuperTab like snippets behavior.
  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  "imap <expr><TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ neosnippet#expandable_or_jumpable() ?
  " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  
  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif

  " For open file in last edited line
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
" }

" C Configurations {
  au BufReadPost *.c set tabstop=2
  au BufReadPost *.c set softtabstop=2
  au BufReadPost *.c set shiftwidth=2
  au BufReadPost *.h set tabstop=2
  au BufReadPost *.h set softtabstop=2
  au BufReadPost *.h set shiftwidth=2
" }

" Cucumber Configurations {
  au BufReadPost *.feature set tabstop=2
  au BufReadPost *.feature set softtabstop=2
  au BufReadPost *.feature set shiftwidth=2
  au BufReadPost *.feature set tw=0
" }

" Java Configurations {
  au BufReadPost *.java set tabstop=4
  au BufReadPost *.java set softtabstop=4
  au BufReadPost *.java set shiftwidth=4
  let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
" }

" Javascript Configurations {
  set wildignore+=node_modules/** 
" }

" HTML Configurations {
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
  let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
  let g:closetag_filetypes = 'html,xhtml,phtml'
  let g:closetag_xhtml_filetypes = 'xhtml,jsx'
  let g:closetag_emptyTags_caseSensitive = 1

  au BufReadPost *.html set autoindent
" }

" Ruby Configurations {
  if !exists("rvm_loaded")
    au GUIEnter Rvm use 2.6.3
    au GUIEnter Rvm gemset use nvim
	  let rvm_loaded = 1
	endif
" }

" Python Configurations {
  au BufReadPost *.py set tabstop=4
  au BufReadPost *.py set softtabstop=4
  au BufReadPost *.py set shiftwidth=4
  au BufReadPost *.py set textwidth=120
  au BufReadPost *.py set expandtab
  au BufReadPost *.py set autoindent
  au BufReadPost *.py set fileformat=unix
  au BufReadPost *.robot set tw=0
  set wildignore+=venv/**
" }

" Rest Configurations {
  au BufReadPost *.rest set autoindent
" }

" Rust Configurations {
  let g:rustfmt_autosave=1
" }

" Theme Options {
  colorscheme kuroi 
  let g:airline_theme='kolor'
  if exists('g:GtkGuiLoaded')
  else
    hi Normal guibg=NONE ctermbg=NONE
  end
" }

" Map Options {
  " Buffers {
    map <leader>> :bnext<CR>
    map <leader>< :bprevious<CR>
  " }
  " Search {
    " Start file search 
    map <leader>f :CtrlP<CR>
    " Show next result after vimgrep
    map <leader>n :cn!<CR>
    map <leader>N :cp!<CR>
  " }

  " Terminal {
    map <leader>t :terminal /bin/zsh<CR>
  " }

  " Windows {
    map <leader>p :NERDTreeToggle<CR>
  " }
" }
