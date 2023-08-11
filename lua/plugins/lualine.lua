return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-web-devicons', opt = true },
		event = {'BufNewFile', 'BufRead'},
		config = function()
			require('lualine').setup {
				options = {
					theme = 'tokyonight',
					section_separators = {'', ''},
					component_separators = {'', ''},
					icons_enabled = true,
				},
				sections = {
					lualine_a = { {'mode', upper = true} },
					lualine_b = { {'branch', icon = ''} },
					lualine_c = { {'filename', file_status = true, path = 1} },
					lualine_x = { 'encoding', 'fileformat', 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location'  },
				},
				inactive_sections = {
					lualine_a = {  },
					lualine_b = {  },
					lualine_c = { {'filename', path = 1}  },
					lualine_x = { 'location' },
					lualine_y = {  },
					lualine_z = {   }
				}
			}
		end
	}
}
