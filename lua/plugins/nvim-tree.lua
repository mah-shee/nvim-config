return {
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		keys = {
			{ '<C-n>', ':NvimTreeToggle<CR>' },
			{ '<C-j>', ':NvimTreeFindFile<CR>' },
		},
		config = function()
			require("nvim-tree").setup()
		end
	},
}
