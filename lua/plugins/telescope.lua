return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim', },
		tag = '0.1.2',
		keys = {
			{ '/', ':Telescope live_grep<CR>' }
		},
		config = function()
			require('telescope').setup {
				defaults = {
					file_sorter = require 'telescope.sorters'.get_fuzzy_file,
					generic_sorter = require 'telescope.sorters'.get_generic_fuzy_sorter,
					mappings = {
						n = {
							["q"] = require 'telescope.actions'.close,
						}
					}
				}
			}
		end
	},
}
