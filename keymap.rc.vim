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
set conceallevel=0
autocmd InsertLeave * set nopaste
