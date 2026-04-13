local augroup = vim.api.nvim_create_augroup("UserAutoCmds", { clear = true })

vim.api.nvim_create_autocmd("CursorHold", {
	group = augroup,
	callback = function()
		-- Insertモードやコマンドラインでは表示しない
		local mode = vim.api.nvim_get_mode().mode
		if mode == 'n' then
			vim.diagnostic.open_float(nil, { focusable = false })
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = augroup,
	pattern = "*.py",
	callback = function()
		vim.keymap.set('n', '<C-e>', ':!python %<CR>', { buffer = true })
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	group = augroup,
	callback = function()
		vim.o.paste = false
	end,
})
