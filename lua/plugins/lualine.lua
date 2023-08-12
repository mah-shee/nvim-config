return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-web-devicons', opt = true },
		event = {'BufNewFile', 'BufRead'},
		opts = {
			options = {
				theme = 'tokyonight',
				section_separators = {'', ''},
				component_separators = {'', ''},
				icons_enabled = true,
			},
			sections = {
				lualine_a = { {'mode', upper = true} },
				lualine_b = {
					{'branch', icon = ''},
					{'diff'},
					{
						'diagnostics',
						sources = { 'nvim_diagnostic', 'nvim_lsp' },
						sections = { 'error', 'warn', 'info', 'hint' },
						symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
						colored = true,
					},
				},
				lualine_c = {
					{
						'filename',
						file_status = true, path = 1
					},
				},
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' },
			},
			inactive_sections = {
				lualine_a = { },
				lualine_b = { },
				lualine_c = { {'filename', path = 1}  },
				lualine_x = { 'location' },
				lualine_y = { },
				lualine_z = { }
			},
			tabline = {
				lualine_a = {
					{
						'buffers',
						symbols = { modified = '_󰷥', alternate_file = ' ', directory = ' ' },
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {
					'diff'
				},
				lualine_y = {
					'branch'
				},
				lualine_z = {
					{ 'tabs' },
				},
			},
		},
		config = function()
			require('lualine').setup {
			}
		end
	}
}
