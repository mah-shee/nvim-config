local api = vim.api

vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

local vars = {
	python_host_prog = '/Users/masa/.pyenv/shims/python',
	python3_host_prog = '/Users/masa/.pyenv/shims/python3',
	loaded_matchparen = 1
}
for var, val in pairs(vars) do
	api.nvim_set_var(var, val)
end

require('config.autocmds')
require('config.keymaps')
require('config.options')
require('config.lazy')
