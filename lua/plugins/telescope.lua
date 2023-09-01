return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		tag = '0.1.2',
		keys = {
			{ '/', ':Telescope live_grep<CR>' }
		},
		config = function()
			require('telescope').setup {}
		end
	},
}
