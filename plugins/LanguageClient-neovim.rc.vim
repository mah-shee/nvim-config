set hidden
set updatetime=50
" 言語ごとに設定する
"
augroup filetype_rust
    autocmd!
    autocmd BufReadPost *.rs setlocal filetype=rust
augroup END

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'sass': ['css-languageserver', '--stdio'],
    \ 'less': ['css-languageserver', '--stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ 'go': ['gopls'],
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'haskell': ['haskell-language-server-wrapper', '--lsp'],
    \ }

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

augroup LCHighlight
    autocmd!
    autocmd CursorHold,CursorHoldI *.py,*.c,*.cpp,*.rs,*.js,*.ts,*.go  call LanguageClient#textDocument_documentHighlight()
augroup END

let g:LanguageClient_rootMarkers = {
            \ 'rust' : ['Cargo.toml'],
            \ 'haskell': ['*.cabal', 'stack.yaml'],
            \ }


let $RUST_BACKTRACE = 1
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
let g:LanguageClient_devel = 1 " Use rust debug build
let g:LanguageClient_loggingLevel = 'INFO' " Use highest logging level

let g:LanguageClient_loggingFile = expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

let g:LanguageClient_autoStart = 1
let g:LanguageClient_autoStop = 1
nnoremap <F6> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> [Space]h :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> [Space]d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> [Space]r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> [Space]f :call LanguageClient_textDocument_formatting()<CR>
nnoremap <silent> [Space]n :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> [Space]t :call LanguageClient_textDocument_typeDefinition()<CR>
nnoremap <silent> [space]c :call LanguageClient_textDocument_codeAction()<CR> 
nnoremap <silent> [Space]m :call LanguageClient#textDocument_documentSymbol()<CR>

" augroup LCHighlight
"     autocmd!
"     autocmd CursorHold,CursorHoldI *.py,*.c,*.cpp,*.rs,*.js,*.jsx,*.ts call LanguageClient#textDocument_documentHighlight()
" augroup END
"
