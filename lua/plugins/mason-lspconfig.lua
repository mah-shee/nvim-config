return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require('mason-lspconfig').setup_handlers({ function(server)
				local opt = {
					-- -- Function executed when the LSP server startup
					on_attach = function(client, bufnr)
						local opts = { noremap = true, silent = true }
						vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

--[[
						vim.cmd [[
		highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
		highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
		highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
		augroup lsp_document_highlight
		autocmd! * <buffer>
		autocmd CursorMoved,CursorMovedI <buffer> lua vim.lsp.buf.clear_references()
		augroup END
		]]
--]]
					end,
					capabilities = require('cmp_nvim_lsp').default_capabilities(
						vim.lsp.protocol.make_client_capabilities()
					),
					flags = {
						debounce_text_changes = 150,
					}
				}
				require('lspconfig')[server].setup(opt)
			end
			})
		end
	}
}
