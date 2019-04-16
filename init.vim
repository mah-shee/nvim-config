if &compatible
  set nocompatible
endif

let g:python_host_prog = system("echo -n (pyenv root)/versions/(pyenv global | grep '^2')/bin/python")
let g:python3_host_prog = system("echo -n (pyenv root)/versions/(pyenv global | grep '^3')/bin/python")

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
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

runtime! options.rc.vim
runtime! keymap.rc.vim
