return {
	{
		"mason-org/mason-lspconfig.nvim",
		version = "^1.0.0",
		opts = {
			ensure_installed = { "lua_ls", "rust_analyzer" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			local mason_lspconfig = require('mason-lspconfig')
			local lspconfig = require('lspconfig')

			local on_attach = function(_, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "formatexpr",
					"v:lua.vim.lsp.formatexpr(#{timeout_ms:250})")
			end

			-- LSPサーバーごとの設定を分離し、可読性を向上
			local function get_default_capabilities()
				return require('cmp_nvim_lsp').default_capabilities()
			end

			local function setup_lua_ls()
				lspconfig.lua_ls.setup {
					on_init = function(client)
						local path = client.workspace_folders[1].name
						local has_luarc = vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')
						if not has_luarc then
							local lua_settings = {
								Lua = {
									runtime = { version = 'LuaJIT' },
									diagnostics = { globals = { 'vim' } },
									workspace = {
										checkThirdParty = false,
										library = { vim.env.VIMRUNTIME }
									},
									telemetry = { enable = false },
									hint = { enable = true },
								}
							}
							client.config.settings = vim.tbl_deep_extend('force', client.config.settings, lua_settings)
							client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
						end
						return true
					end,
					on_attach = on_attach,
					capabilities = get_default_capabilities(),
				}
			end

			local function setup_gopls()
				lspconfig.gopls.setup {
					cmd = { "gopls", "serve" },
					settings = {
						gopls = {
							analyses = { unusedparams = true },
							staticcheck = true,
						},
					},
					on_attach = on_attach,
					capabilities = get_default_capabilities(),
				}
			end

			local function setup_rust_analyzer()
				lspconfig.rust_analyzer.setup {
					flags = { debounce_text_changes = 150 },
					settings = {
						["rust-analyzer"] = {
							assist = {
								importMergeBehavior = "last",
								importPrefix = "by_self",
							},
							cargo = { loadOutDirsFromCheck = true },
							procMacro = { enable = true },
							inlayHints = {
								lifetimeElisionHints = { enable = "always" },
								bindingModeHints = { enable = true },
								expressionAdjustmentHints = { enable = true },
							},
						}
					},
					on_attach = on_attach,
					capabilities = get_default_capabilities(),
				}
			end

			mason_lspconfig.setup_handlers({
				-- デフォルトのLSPサーバー設定
				function(server_name)
					if server_name ~= "lua_ls" and server_name ~= "gopls" and server_name ~= "rust_analyzer" then
						lspconfig[server_name].setup {
							on_attach = on_attach,
							capabilities = get_default_capabilities(),
						}
					end
				end,
				-- サーバーごとの個別設定
				["lua_ls"] = setup_lua_ls,
				["gopls"] = setup_gopls,
				["rust_analyzer"] = setup_rust_analyzer,
			})
			vim.cmd("LspStart")
		end,
	}
}
