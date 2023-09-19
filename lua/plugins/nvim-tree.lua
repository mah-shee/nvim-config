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
			require("nvim-tree").setup({
				view = {
					signcolumn = 'no',
				},
				filters = {
					dotfiles = true,
				},
				renderer = {
					highlight_git = true,
					highlight_opened_files = 'name',
					icons = {
						glyphs = {
							git = {
								unstaged = '!',
								renamed = '»',
								untracked = '?',
								deleted = '✘',
								staged = '✓',
								unmerged = '',
								ignored = '◌',
							},
						},
					},
				},
			})
		end
	},
}
