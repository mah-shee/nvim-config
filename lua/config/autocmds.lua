vim.cmd([[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

vim.cmd('autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %')
-- for deoplete to leave the preview window always closed
vim.cmd('autocmd InsertLeave * set nopaste')
