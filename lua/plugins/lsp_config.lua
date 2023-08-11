return {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'williamboman/mason.nvim',
		},
		config = function()
			local nvim_lsp = require('lspconfig')

			local on_attach = function(client, bufnr)
				local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
				local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

				buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

				-- Mappings.
				local opts = { noremap=true, silent=true }
				buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
				buf_set_keymap('n', '[Space]d', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
				buf_set_keymap('n', '[Space]h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
				buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
				buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
				buf_set_keymap('n', '[Space]wa', '<cmd>lua vim.lsp.buf.add_workSpace_folder()<CR>', opts)
				buf_set_keymap('n', '[Space]wr', '<cmd>lua vim.lsp.buf.remove_workSpace_folder()<CR>', opts)
				buf_set_keymap('n', '[Space]wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workSpace_folders()))<CR>', opts)
				buf_set_keymap('n', '[Space]t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
				buf_set_keymap('n', '[Space]r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
				buf_set_keymap('n', '[Space]n', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
				buf_set_keymap('n', '[Space]e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
				buf_set_keymap('n', '[Space]q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
				buf_set_keymap("n", "[Space]f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
				-- Set some keybinds conditional on server capabilities
				if client.resolved_capabilities.document_formatting then
					buf_set_keymap("n", "[Space]f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
				elseif client.resolved_capabilities.document_range_formatting then
					buf_set_keymap("n", "[Space]f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
				end
			end

			nvim_lsp.rust_analyzer.setup({
				cmd = {"rustup", "run", "nightly", "rust-analyzer"};
				filetypes = { "rust" };
				root_dir = nvim_lsp.util.root_pattern("Cargo.toml");
				on_attach=on_attach,
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

			nvim_lsp.gopls.setup{ on_attach = on_attach;
				root_dir = nvim_lsp.util.root_pattern('go.mod');
				cmd = {"gopls", "serve"};
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
							globals = {'vim'},
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			}

			vim.keymap.set('n', '[Space]a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
			vim.keymap.set('n', '[Space]e', '<cmd>lua vim.diagnostic.open_float()<CR>')
			vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
			vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
			-- LSP handlers
			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics, {
					--    underline = false, -- Enable underline, use default values
					virtual_text = true-- Enable virtual text only on Warning or above, override spacing to 2
				}
			)
		end
	}
}
