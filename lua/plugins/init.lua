return {
	{
		'j-hui/fidget.nvim',
		tag = 'legacy',
	},
	{
		'tpope/vim-surround',
		event = 'InsertEnter',
	},
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({})
		end,
	},
	'nvim-tree/nvim-web-devicons',
	'HiPhish/nvim-ts-rainbow2',
	'nvim-lua/popup.nvim',
	'nvim-lua/plenary.nvim',
	'puremourning/vimspector',
}
