set hidden
set signcolumn=yes
set updatetime=50
" 言語ごとに設定する
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'sass': ['css-languageserver', '--stdio'],
    \ 'less': ['css-languageserver', '--stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ }

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

" let $RUST_BACKTRACE = 1
" let g:LanguageClient_devel = 1 " Use rust debug build
" let g:LanguageClient_loggingLevel = 'INFO' " Use highest logging level

let g:LanguageClient_loggingFile = expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

let g:LanguageClient_autoStart = 1
let g:LanguageClient_autoStop = 1
nnoremap <silent> [Space]h :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> [Space]d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> [Space]r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> [Space]f :call LanguageClient_textDocument_formatting()<CR>
nnoremap <silent> [Space]t :call LanguageClient_textDocument_typeDefinition()<CR>

augroup LCHighlight
    autocmd!
    autocmd CursorHold,CursorHoldI *.py,*.c,*.cpp,*.rs,*.js,*.jsx,*.ts call LanguageClient#textDocument_documentHighlight()
augroup END

