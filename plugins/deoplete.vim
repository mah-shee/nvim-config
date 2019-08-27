let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
" inoremap <expr><tab> pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"
call deoplete#custom#option({
      \ 'auto_refresh_delay': 10,
      \ 'camel_case': v:true,
      \ 'skip_multibyte': v:true,
      \ 'prev_completion_mode': 'length',
      \ 'auto_preview': v:true,
      \ })

call deoplete#custom#option('candidate_marks',
      \ ['A', 'S', 'D', 'F', 'G'])
inoremap <expr>A       pumvisible() ? deoplete#insert_candidate(0) : 'A'
inoremap <expr>S       pumvisible() ? deoplete#insert_candidate(1) : 'S'
inoremap <expr>D       pumvisible() ? deoplete#insert_candidate(2) : 'D'
inoremap <expr>F       pumvisible() ? deoplete#insert_candidate(3) : 'F'
inoremap <expr>G       pumvisible() ? deoplete#insert_candidate(4) : 'G'
