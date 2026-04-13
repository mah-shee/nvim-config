return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Set global LSP capabilities before servers are enabled
			local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
			if ok then
				vim.lsp.config('*', {
					capabilities = cmp_lsp.default_capabilities(),
				})
			end

			require('mason-lspconfig').setup({
				ensure_installed = { "lua_ls", "rust_analyzer" },
				automatic_enable = true,
			})
		end,
	}
}
