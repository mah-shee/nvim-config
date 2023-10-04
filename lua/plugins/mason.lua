return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
		build = ":MasonUpdate",
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
		},
		config = function()
			require('mason').setup {
				ui = {
					check_outdated_packages_on_open = false,
					border = 'single',
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					},
				},
			}
			require("mason-lspconfig").setup {
				ensure_installed = { "lua_ls", "rust_analyzer" },
			}

			local lspconfig = require('lspconfig')
			local on_attach = function(_, bufnr)
				vim.api.nvim_buf_set_option(bufnr, "formatexpr",
					"v:lua.vim.lsp.formatexpr(#{timeout_ms:250})")
			end

			require('mason-lspconfig').setup_handlers {
				function(server_name)
					lspconfig[server_name].setup {
						on_attach = on_attach,
						capabilities = require('cmp_nvim_lsp').default_capabilities(),
					}
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup {
						on_init = function(client)
							local path = client.workspace_folders[1].name
							if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
								client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
									Lua = {
										runtime = {
											-- Tell the language server which version of Lua you're using
											-- (most likely LuaJIT in the case of Neovim)
											version = 'LuaJIT'
										},

										diagnostics = {
											-- Get the language server to recognize the `vim` global
											globals = { 'vim' },
										},
										-- Make the server aware of Neovim runtime files
										workspace = {
											checkThirdParty = false,
											library = {
												vim.env.VIMRUNTIME
												-- "${3rd}/luv/library"
												-- "${3rd}/busted/library",
											}
										},
										telemetry = {
											enable = false,
										},
										hint = {
											enable = true,
										},
									}
								})

								client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
							end
							return true
						end,
					}
				end,
				["gopls"] = function()
					lspconfig.gopls.setup {
						cmd = { "gopls", "serve" },
						settings = {
							gopls = {
								analyses = {
									unusedparams = true,
								},
								staticcheck = true,
							},
						},
					}
				end,
				["rust_analyzer"] = function()
					lspconfig.rust_analyzer.setup({
						flags = {
							debounce_text_changes = 150,
						},
						settings = {
							["rust-analyzer"] = {
								assist = {
									importMergeBehavior = "last",
									importPrefix = "by_self",
								},
								cargo = {
									loadOutDirsFromCheck = true
								},
								procMacro = {
									enable = true
								},
								inlayHints = {
									lifetimeElisionHints = {
										enable = "always"

									},
									bindingModeHints = {
										enable = true
									},
									expressionAdjustmentHints = {
										enable = true
									}
								},
							}
						}
					})
				end,

			}
			vim.cmd("LspStart")
		end
	}
}
