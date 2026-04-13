return {
	{
		'j-hui/fidget.nvim',
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
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		'echasnovski/mini.nvim',
		event = 'InsertEnter',
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		'puremourning/vimspector',
		cmd = { 'VimspectorReset', 'VimspectorLaunch' },
		keys = {
			{ '<F9>' },
		},
	},
}
