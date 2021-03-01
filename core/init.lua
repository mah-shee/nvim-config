local api = vim.api

vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

vim.cmd('filetype off')
vim.cmd('syntax off')

local vars = {
  python_host_prog = '/usr/bin/python2',
  python3_host_prog = '/usr/bin/python3',
  loaded_matchparen = 1
}

for var, val in pairs(vars) do
  api.nvim_set_var(var, val)
end

-- require('core.options')
-- require('core.keys')
-- require('core.ime')
require('plugins.dein')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
