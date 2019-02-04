set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set shiftround
set splitright
set cursorline
set clipboard=unnamed
set hls
set runtimepath+=/Users/masatoshi/.cache/dein/repos/github.com/Shougo/dein.vim
set list
set wrap
set textwidth=0 
set colorcolumn=80
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" for Python
let g:python_host_prog = $PYENV_ROOT.'/shims/python2'
let g:python3_host_prog = $PYENV_ROOT.'/shims/python3'

if &compatible
  set nocompatible
endif
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable

:command UP UpdateRemotePlugins
:command CH checkhealth
