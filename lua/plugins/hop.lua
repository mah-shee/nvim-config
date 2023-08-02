require'hop'.setup{
	keys = 'etovxqpdygfblzhckisuran',
	vim.api.nvim_set_keymap('n', '<Leader>l', "<cmd>lua require'hop'.hint_words()<cr>", {}),
	vim.api.nvim_set_keymap('n', '<Leader>w', "<cmd>lua require'hop'.hint_patterns()<cr>", {}),
	vim.api.nvim_set_keymap('n', '<Leader>j', "<cmd>lua require'hop'.hint_lines_skip_whitespace()<cr>", {}),

}
