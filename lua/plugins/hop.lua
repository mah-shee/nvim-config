return {
	{
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		keys = {
			{'<Leader>l', "<cmd>lua require'hop'.hint_words()<cr>"},
			{'<Leader>w', "<cmd>lua require'hop'.hint_patterns()<cr>"},
			{'<Leader>j', "<cmd>lua require'hop'.hint_lines_skip_whitespace()<cr>"},
		},
		config = function()
			require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	},
}
