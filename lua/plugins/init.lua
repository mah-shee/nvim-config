return {
	{
		'j-hui/fidget.nvim',
		tag = 'legacy',
		event = "LspAttach",
		config = function()
			require"fidget".setup{}
		end
	},
	{
		"kylechui/nvim-surround",
		event = "InsertEnter",
		config = function()
			require("nvim-surround").setup()
		end
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup()
		end,
	},
	{
		'echasnovski/mini.nvim',
		event = 'InsertEnter',
		config = function()
			require("mini.pairs").setup()
		end,
	},
	'nvim-tree/nvim-web-devicons',
	'nvim-lua/popup.nvim',
	'nvim-lua/plenary.nvim',
	'puremourning/vimspector',
	'neovim/nvim-lspconfig',
}
