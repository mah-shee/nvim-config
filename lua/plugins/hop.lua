return {
	{
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		keys = {
			{'<Leader>l', "<cmd>lua require'hop'.hint_words()<cr>"},
			{'<Leader>w', "<cmd>lua require'hop'.hint_patterns()<cr>"},
			{'<Leader>j', "<cmd>lua require'hop'.hint_lines_skip_whitespace()<cr>"},
			{'f', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })end, {remap=true}},
			{'F', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true }) end, {remap=true}},
			{'t', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, {remap=true}},
			{'T', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true ,hint_offset = 1})end, {remap=true}},
		},
		opts = {
			keys = 'etovxqpdygfblzhckisuran'
		},
		config = function()
			require('hop').setup()
		end
	},
}
