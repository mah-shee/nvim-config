let g:quickrun_config = {
    \ '_' : {
        \ 'runner' : 'vimproc',
        \ 'runner/vimproc/updatetime' : 60,
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split' : 'vertical',
        \ 'outputter/buffer/close_on_empty' : 1,
    \ },
    \ 'rust' : {
        \ 'command': 'cargo',
        \ 'exec' : '%c run',
        \ 'outputter' : 'buffer',
    \}
\}

nmap <Leader>r :cclose<CR>:write<CR>:QuickRun<CR>
