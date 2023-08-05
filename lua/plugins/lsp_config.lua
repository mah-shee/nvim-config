local nvim_lsp = require('lspconfig')
local mason = require('mason')
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

require('mason-lspconfig').setup_handlers({ function(server)
	local opt = {
		-- -- Function executed when the LSP server startup
		on_attach = function(client, bufnr)
			local opts = { noremap=true, silent=true }
			vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
			vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.format({async=true})'

			vim.cmd [[
		highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
		highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
		highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
		augroup lsp_document_highlight
		autocmd! * <buffer>
		-- autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
		autocmd CursorMoved,CursorMovedI <buffer> lua vim.lsp.buf.clear_references()
		augroup END
		]]

		end,
		capabilities = require('cmp_nvim_lsp').default_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		),
		flags = {
			debounce_text_changes = 150,
		}
	}
	require('lspconfig')[server].setup(opt)
end })

-- keyboard shortcut
vim.keymap.set('n', '[Space]h',  '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '[Space]f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', '[Space]n', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '[Space]d', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '[Space]t', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', '[Space]r', '<cmd>lua vim.lsp.buf.rename()<CR>')
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
-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" , keyword_length = 3},
		{ name = "buffer" , keyword_length = 2},
		{ name = "path" },
		{ name = 'nvim_lsp_signature_help'},
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		['<C-l>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm { select = true },
		['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
	}),
	experimental = {
		ghost_text = true,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = {'menu', 'abbr', 'kind'},
		format = function(entry, item)
			local menu_icon ={
				nvim_lsp = 'λ',
				vsnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
})

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
require'lspconfig'.lua_ls.setup {
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
function Goimports(timeout_ms)
	local context = { source = { organizeImports = true } }
	vim.validate { context = { context, "t", true } }

	local params = vim.lsp.util.make_range_params()
	params.context = context

	-- See the implementation of the textDocument/codeAction callback
	-- (lua/vim/lsp/handler.lua) for how to do this properly.
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
	if not result or next(result) == nil then return end
	local actions = result[1].result
	if not actions then return end
	local action = actions[1]

	-- textDocument/codeAction can return either Command[] or CodeAction[]. If it
	-- is a CodeAction, it can have either an edit, a command or both. Edits
	-- should be executed first.
	if action.edit or type(action.command) == "table" then
		if action.edit then
			vim.lsp.util.apply_workspace_edit(action.edit)
		end
		if type(action.command) == "table" then
			vim.lsp.buf.execute_command(action.command)
		end
	else
		vim.lsp.buf.execute_command(action)
	end
end

vim.api.nvim_exec("autocmd BufWritePre *.go lua Goimports(1000)",false)
