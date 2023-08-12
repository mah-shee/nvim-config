return {
	{
		'lukas-reineke/indent-blankline.nvim',
		event = {'BufNewFile', 'BufRead'},
		opts = {
			space_char_blankline = " ",
			show_current_context = true,
			show_current_context_start = true,
		},
		config = function()
			require("indent_blankline").setup()
		end
	}
}
