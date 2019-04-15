set number
set autoindent
set tabstop=8
set shiftwidth=4
set softtabstop=4
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
inoremap jj <Esc>
nnoremap j gj
nnoremap k gk
tnoremap <Esc> <C-\><C-n>
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
" for deoplete to leave the preview window always closed
set completeopt-=preview
" for Python
let g:python_host_prog = system("echo -n (pyenv root)/versions/(pyenv global | grep '^2')/bin/python")
let g:python3_host_prog = system("echo -n (pyenv root)/versions/(pyenv global | grep '^3')/bin/python")

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

:command! UP UpdateRemotePlugins
:command! CH checkhealth
:command! Tnew tabnew | terminal

highlight! Normal ctermbg=NONE guibg=NONE
highlight! NonText ctermbg=NONE guibg=NONE
highlight! LineNr ctermbg=NONE guibg=NONE
