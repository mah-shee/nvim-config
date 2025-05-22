return {
	{
		{
			"mason-org/mason.nvim",
			version = "^1.0.0",
			dependencies = {
				'williamboman/mason-lspconfig.nvim',
				'neovim/nvim-lspconfig',
				'hrsh7th/cmp-nvim-lsp',
			},
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			}
		}
	},
}
--	{
--		"williamboman/mason.nvim",
--		cmd = "Mason",
--		event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
--		build = ":MasonUpdate",
--		dependencies = {
--			'williamboman/mason-lspconfig.nvim',
--			'neovim/nvim-lspconfig',
--			'hrsh7th/cmp-nvim-lsp',
--		},
--		config = function()
--			local mason = require('mason')
--			local lspconfig = require('lspconfig')
--			local mason_lspconfig = require('mason-lspconfig')
--
--			mason.setup {
--				ui = {
--					check_outdated_packages_on_open = false,
--					border = 'single',
--					icons = {
--						package_installed = "✓",
--						package_pending = "➜",
--						package_uninstalled = "✗"
--					},
--				},
--			}
--			mason_lspconfig.setup {
--				ensure_installed = { "lua_ls", "rust_analyzer" },
--				automatic_installation = true,
--			}
--
--			local on_attach = function(_, bufnr)
--				vim.api.nvim_buf_set_option(bufnr, "formatexpr",
--					"v:lua.vim.lsp.formatexpr(#{timeout_ms:250})")
--			end
--
--			-- LSPサーバーごとの設定を分離し、可読性を向上
--			local function get_default_capabilities()
--				return require('cmp_nvim_lsp').default_capabilities()
--			end
--
--			local function setup_lua_ls()
--				lspconfig.lua_ls.setup {
--					on_init = function(client)
--						local path = client.workspace_folders[1].name
--						local has_luarc = vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')
--						if not has_luarc then
--							local lua_settings = {
--								Lua = {
--									runtime = { version = 'LuaJIT' },
--									diagnostics = { globals = { 'vim' } },
--									workspace = {
--										checkThirdParty = false,
--										library = { vim.env.VIMRUNTIME }
--									},
--									telemetry = { enable = false },
--									hint = { enable = true },
--								}
--							}
--							client.config.settings = vim.tbl_deep_extend('force', client.config.settings, lua_settings)
--							client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
--						end
--						return true
--					end,
--					on_attach = on_attach,
--					capabilities = get_default_capabilities(),
--				}
--			end
--
--			local function setup_gopls()
--				lspconfig.gopls.setup {
--					cmd = { "gopls", "serve" },
--					settings = {
--						gopls = {
--							analyses = { unusedparams = true },
--							staticcheck = true,
--						},
--					},
--					on_attach = on_attach,
--					capabilities = get_default_capabilities(),
--				}
--			end
--
--			local function setup_rust_analyzer()
--				lspconfig.rust_analyzer.setup {
--					flags = { debounce_text_changes = 150 },
--					settings = {
--						["rust-analyzer"] = {
--							assist = {
--								importMergeBehavior = "last",
--								importPrefix = "by_self",
--							},
--							cargo = { loadOutDirsFromCheck = true },
--							procMacro = { enable = true },
--							inlayHints = {
--								lifetimeElisionHints = { enable = "always" },
--								bindingModeHints = { enable = true },
--								expressionAdjustmentHints = { enable = true },
--							},
--						}
--					},
--					on_attach = on_attach,
--					capabilities = get_default_capabilities(),
--				}
--			end
--
--			mason_lspconfig.setup_handlers({
--				-- デフォルトのLSPサーバー設定
--				function(server_name)
--					if server_name ~= "lua_ls" and server_name ~= "gopls" and server_name ~= "rust_analyzer" then
--						lspconfig[server_name].setup {
--							on_attach = on_attach,
--							capabilities = get_default_capabilities(),
--						}
--					end
--				end,
--				-- サーバーごとの個別設定
--				["lua_ls"] = setup_lua_ls,
--				["gopls"] = setup_gopls,
--				["rust_analyzer"] = setup_rust_analyzer,
--			})
--			vim.cmd("LspStart")
--		end
--	},
-- }
