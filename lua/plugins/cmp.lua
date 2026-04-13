return {
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup()
				end
			},
			'saadparwaiz1/cmp_luasnip',
			{
				'L3MON4D3/LuaSnip',
				version = "v2.*",
			},
		},
		config = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
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
				sources = {
					{ name = "nvim_lsp", keyword_length = 2 },
					{ name = "buffer", keyword_length = 2 },
					{ name = "path" },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'luasnip' },
					{ name = "copilot" },
				},
				formatting = {
					fields = { 'menu', 'abbr', 'kind' },
					format = function(entry, item)
						local menu_icon = {
							nvim_lsp = 'λ',
							luasnip = '⋗',
							buffer = 'Ω',
							path = '🖫',
							copilot = "",
						}
						item.menu = menu_icon[entry.source.name]
						return item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				sorting = defaults.sorting,
				window = {
					completion = cmp.config.window.bordered({
						border = 'single',
					}),
					documentation = cmp.config.window.bordered({
						border = 'single',
					}),
				},
			})
		end,
	},
}
