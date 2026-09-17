return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"rust-analyzer",
				"typescript-language-server",
			},
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		},
	},
}
