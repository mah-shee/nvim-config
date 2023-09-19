return {
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'zbirenbaum/copilot-cmp',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			return {
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
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
					{ name = "nvim_lsp",               keyword_length = 3 },
					{ name = "buffer",                 keyword_length = 2 },
					{ name = "path" },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'vsnip' },
					{ name = "copilot",                group_index = 2 },
				},
				formatting = {
					fields = { 'menu', 'abbr', 'kind' },
					format = function(entry, item)
						local menu_icon = {
							nvim_lsp = 'λ',
							vsnip = '⋗',
							buffer = 'Ω',
							path = '🖫',
							Copilot = "",
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
			}
		end,
	},
	{
		'hrsh7th/cmp-nvim-lsp',
	},
	{
		'hrsh7th/cmp-buffer',
	},
	{
		'hrsh7th/cmp-path',
	},
	{
		'hrsh7th/cmp-nvim-lsp-signature-help',
	},
	{
		'hrsh7th/cmp-vsnip'

	},
	{
		'hrsh7th/vim-vsnip'

	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end
	},
}
