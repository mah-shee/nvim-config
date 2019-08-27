set hidden

" 言語ごとに設定する
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_autoStart = 1
nnoremap <silent> [Space]h :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> [Space]d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> [Space]r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> [Space]f :call LanguageClient_textDocument_formatting()<CR>

augroup LCHighlight
    autocmd!
    autocmd CursorHold,CursorHoldI *.py,*.c,*.cpp,*.rs call LanguageClient#textDocument_documentHighlight()
augroup END

set updatetime=50
