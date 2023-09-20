return {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'williamboman/mason.nvim',
			'lvimuser/lsp-inlayhints.nvim',
		},
		opts = {
			inlay_hints = {
				enabled = true,
			}
		},
		config = function()
			local nvim_lsp = require('lspconfig')

			local on_attach = function(client, bufnr)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

				vim.api.nvim_create_augroup("lsp_augroup", { clear = true })

				vim.api.nvim_create_autocmd("InsertEnter", {
					buffer = bufnr,
					callback = function() vim.lsp.buf.inlay_hint(bufnr, true) end,
					group = "lsp_augroup",
				})
				vim.api.nvim_create_autocmd("InsertLeave", {
					buffer = bufnr,
					callback = function() vim.lsp.buf.inlay_hint(bufnr, false) end,
					group = "lsp_augroup",
				})
			end
			nvim_lsp.rust_analyzer.setup({
				cmd = { "rustup", "run", "nightly", "rust-analyzer" },
				filetypes = { "rust" },
				root_dir = nvim_lsp.util.root_pattern("Cargo.toml"),
				on_attach = on_attach,
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
								enable = true
							},
						},
					}
				}
			})

			nvim_lsp.gopls.setup { on_attach = on_attach,
				root_dir = nvim_lsp.util.root_pattern('go.mod'),
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
			nvim_lsp.lua_ls.setup {
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = 'LuaJIT',
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { 'vim' },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
						hint = {
							enable = true,
						},
					},
				},
			}

			-- LSP handlers
			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics, {
					--    underline = false, -- Enable underline, use default values
					virtual_text = true -- Enable virtual text only on Warning or above, override spacing to 2
				}
			)
		end
	}
}
