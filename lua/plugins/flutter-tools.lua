return {
	{
		'akinsho/flutter-tools.nvim',
		ft = 'dart',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		opts = {
			ui = {
				border = 'single',
			},
			decorations = {
				statusline = {
					app_version = true,
					device = true,
				},
			},
			widget_guides = {
				enabled = true,
			},
			closing_tags = {
				enabled = true,
				prefix = "// ",
				priority = 10,
			},
			lsp = {
				color = {
					enabled = true,
					virtual_text = true,
				},
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					renameFilesWithClasses = "prompt",
					enableSnippets = true,
					updateImportsOnRename = true,
				},
			},
			debugger = {
				enabled = false,
			},
		},
		keys = {
			{ '<leader>fr', '<cmd>FlutterRun<cr>', desc = 'Flutter Run' },
			{ '<leader>fR', '<cmd>FlutterRestart<cr>', desc = 'Flutter Restart' },
			{ '<leader>fq', '<cmd>FlutterQuit<cr>', desc = 'Flutter Quit' },
			{ '<leader>fd', '<cmd>FlutterDevices<cr>', desc = 'Flutter Devices' },
			{ '<leader>fo', '<cmd>FlutterOutlineToggle<cr>', desc = 'Flutter Outline' },
			{ '<leader>fl', '<cmd>FlutterLspRestart<cr>', desc = 'Flutter LSP Restart' },
		},
	},
}
