return {
    {
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			"zbirenbaum/copilot-cmp",
		},
		config = function()
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
					{ name = "copilot", group_index = 2 },
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
							Copilot = "",
						}
						item.menu = menu_icon[entry.source.name]
						return item
					end,
				},
			})
		end
	},
	{
		'hrsh7th/cmp-nvim-lsp',
		event = 'InsertEnter',
	},
	{
		'hrsh7th/cmp-buffer',
		event = 'InsertEnter',
	},
	{
		'hrsh7th/cmp-path',
		event = 'InsertEnter',
	},
	{
		'hrsh7th/cmp-nvim-lsp-signature-help',
		event = 'InsertEnter',
	},
	{
		"zbirenbaum/copilot-cmp",
		event = 'InsertEnter',
		config = function ()
			require("copilot_cmp").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end
	},
}

