inoremap jj <Esc>
tnoremap <Esc> <C-\><C-n>
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
" for deoplete to leave the preview window always closed
autocmd InsertLeave * set nopaste

" Insert mode keymappings:
" <C-t>: insert tab.
inoremap <C-t>  <C-v><TAB>
" Enable undo <C-w> and <C-u>.
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-u>  <C-g>u<C-u>

" Use ',' instead of '\'.
" Use <Leader> in global plugin.
let g:mapleader = ','
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = 'm'

" Release keymappings for plug-in.
nnoremap ;  <Nop>
nnoremap m  <Nop>
nnoremap ,  <Nop>

" [Space]: Other useful commands
" Smart space mapping.
nmap  <Space>   [Space]
nnoremap  [Space]   <Nop>

" Set autoread.
nnoremap [Space]ar
      \ :<C-u>call vimrc#toggle_option('autoread')<CR>
" Set spell check.
nnoremap [Space]p
      \ :<C-u>call vimrc#toggle_option('spell')<CR>
      \: set spelllang=en_us<CR>
      \: set spelllang+=cjk<CR>
nnoremap [Space]w
      \ :<C-u>call vimrc#toggle_option('wrap')<CR>

" Easily edit .vimrc
nnoremap <silent> [Space]ev  :<C-u>edit $MYVIMRC<CR>

" Useful save mappings.
nnoremap <silent> <Leader><Leader> :<C-u>update<CR>

" s: Windows and buffers(High priority)
" The prefix key.
nnoremap    [Window]   <Nop>
nmap    s [Window]
nnoremap <silent> [Window]p  :<C-u>vsplit<CR>:wincmd w<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> <Tab>      :wincmd w<CR>
nnoremap <silent><expr> q winnr('$') != 1 ? ':<C-u>close<CR>' : ""
nnoremap [Space]l :source ~/.config/nvim/init.vim<CR>
