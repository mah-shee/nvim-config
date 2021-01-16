  let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ }
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#virtualenv#enabled = 1
  let g:airline#extensions#hunks#enabled = 0

  let g:airline#extensions#lsp#enabled = 1
  let airline#extensions#lsp#error_symbol = 'E:'
  let airline#extensions#lsp#warning_symbol = 'W:'

  let g:airline#extensions#ale#enabled = 0
  let g:airline#extensions#ale#error_symbol = 'E:'
  let g:airline#extensions#ale#warning_symbol = 'W:'
