set signcolumn=yes
set updatetime=1000

nnoremap [gitgutter] <Nop>
nmap <C-h> [gitgutter]
nnoremap [gitgutter]j <Plug>GitGutterNextHunk
nnoremap [gitgutter]k <Plug>GitGutterPrevHunk
nnoremap [gitgutter]u <Plug>GitGutterUndoHunk
