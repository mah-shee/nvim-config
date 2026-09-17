return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
		},
		config = function()
			-- グローバルcapabilities設定（全LSPサーバーに適用）
			local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
			if ok then
				vim.lsp.config('*', {
					capabilities = cmp_lsp.default_capabilities(),
				})
			end

			-- 使用するLSPサーバーを有効化
			-- lsp/ ディレクトリの設定ファイルが自動で読み込まれる
			vim.lsp.enable({
				'lua_ls',
				'rust_analyzer',
				'gopls',
				'ts_ls',
				-- dartls はflutter-tools.nvimが管理するため除外
			})
		end,
	},
}
