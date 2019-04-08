let g:quickrun_config = {
    \ '_' : {
        \ 'runner' : 'vimproc',
        \ 'runner/vimproc/updatetime' : 10,
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split' : 'vertical',
    \ }
\}

let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
