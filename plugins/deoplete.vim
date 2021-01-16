let g:deoplete#enable_at_startup = 1

"-1let g:deoplete#file#enable_buffer_path = 1
" inoremap <expr><tab> pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return pumvisible() ? deoplete#close_popup()."\<CR>" : "\<CR>"
endfunction

autocmd CompleteDone * silent! pclose!


call deoplete#custom#source('tabnine', 'rank', 500)
call deoplete#custom#source('tabnine', 'min_pattern_length', 2)
" call deoplete#custom#source('tabnine', 'is_volatile', v:false)
call deoplete#custom#var('tabnine', {
      \ 'line_limit': 500,
      \ 'max_num_results': 20,
      \ })
call deoplete#custom#source('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'matcher_length',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_info',
      \ 'converter_truncate_menu',
      \ ])
call deoplete#custom#source('tabnine', 'converters', [
      \ 'converter_remove_overlap',
      \ 'converter_truncate_info',
      \ ])

call deoplete#custom#option({
      \ 'auto_refresh_delay': 10,
      \ 'camel_case': v:true,
      \ 'skip_multibyte': v:true,
      \ 'prev_completion_mode': 'length',
      \ 'auto_preview': v:true,
      \ })

call deoplete#custom#option('candidate_marks',
      \ ['A', 'S', 'D', 'F', 'G'])
inoremap <expr>A    pumvisible() ?  deoplete#insert_candidate(0) : 'A'
inoremap <expr>S    pumvisible() ?  deoplete#insert_candidate(1) : 'S'
inoremap <expr>D    pumvisible() ?  deoplete#insert_candidate(2) : 'D'
inoremap <expr>F    pumvisible() ?  deoplete#insert_candidate(3) : 'F'
inoremap <expr>G    pumvisible() ?  deoplete#insert_candidate(4) : 'G'
