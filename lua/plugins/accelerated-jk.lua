return {
	{
		'rainbowhxch/accelerated-jk.nvim',
		keys = {
			{'j', '<Plug>(accelerated_jk_gj)'},
			{'k', '<Plug>(accelerated_jk_gk)'}
		},
		opts = {
			mode = 'time_driven',
			enable_deceleration = false,
			acceleration_motions = {},
			acceleration_limit = 500,
			acceleration_table = { 3,6,9,12,15,18,21,24,27,30 },
			deceleration_table = { {150, 9999} }
		},
		config = function()
			require('accelerated-jk').setup()
		end

	}
}
