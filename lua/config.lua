local api = vim.api

vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

vim.cmd('filetype off')
vim.cmd('syntax off')


local vars = {
  python_host_prog = '/Users/masa/.pyenv/shims/python',
  python3_host_prog = '/Users/masa/.pyenv/shims/python3',
  loaded_matchparen = 1
}

for var, val in pairs(vars) do
  api.nvim_set_var(var, val)
end

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

require('options')
require('keys')
require('plugins.dein')
require('plugins.lsp_config')
require('plugins.treesitter')
require('plugins.lualine')
require('plugins.telescope')
require('plugins.ddc')
