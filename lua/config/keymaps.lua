local api = vim.api

-- Use ',' instead of '\'.
vim.g.mapleader = ","
-- Use <Leader> in global plugin.
-- Use <LocalLeader> in filetype plugin.
vim.g.maplocalleader = 'm'

api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = false })
-- api.nvim_set_keymap('t', '<Esc>', '<C-\><C-n>', {noremap = true, silent = false})

-- Insert mode keymappings:
api.nvim_set_keymap('i', '<C-t>', '<C-v><TAB>', { noremap = true, silent = true })
-- Enable undo <C-w> and <C-u>.
api.nvim_set_keymap('i', '<C-w>', '<C-g><C-w>', { noremap = true, silent = true })
api.nvim_set_keymap('i', '<C-u>', '<C-g><C-u>', { noremap = true, silent = true })


-- Release keymappings for plug-in.
api.nvim_set_keymap('n', ';', '<Nop>', { noremap = true, silent = false })
api.nvim_set_keymap('n', 'm', '<Nop>', { noremap = true, silent = false })
api.nvim_set_keymap('n', ',', '<Nop>', { noremap = true, silent = false })

-- [Space]: Other useful commands
-- Smart space mapping.
api.nvim_set_keymap('n', ' ', '[Space]', { noremap = false, silent = false })
api.nvim_set_keymap('n', '[Space]', '<Nop>', { noremap = true, silent = false })


-- Set autoread.
api.nvim_set_keymap('n', '[Space]ar', ':<C-u>call vimrc#toggle_option("autoread")<CR>',
	{ noremap = true, silent = false })
-- Set spell check.
--[[ nnoremap [Space]p
      \ :<C-u>call vimrc#toggle_option('spell')<CR>
      \: set spelllang=en_us<CR>
      \: set spelllang+=cjk<CR>
]]
api.nvim_set_keymap('n', '[Space]w', ':<C-u>call vimrc#toggle_option("wrap")<CR>', { noremap = true, silent = false })

-- Start Terminal
api.nvim_set_keymap('n', '[Window]t', ':<C-u>T<CR>', { noremap = true, silent = false })
vim.cmd [[
  command! T lua TerminalCommand()
]]

function _G.TerminalCommand()
	vim.cmd('split')
	vim.cmd('wincmd j')
	vim.cmd('resize 20')
	vim.cmd('terminal ')
end

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.api.nvim_exec([[
  autocmd TermOpen * startinsert
]], false)

-- Useful save mappings.
api.nvim_set_keymap('n', '<Leader><Leader>', ':<C-u>update<CR>', { noremap = true, silent = false })

-- s: Windows and buffers(High priority)
-- The prefix key.
api.nvim_set_keymap('n', '[Window]', '<Nop>', { noremap = true, silent = false })
api.nvim_set_keymap('n', 's', '[Window]', { noremap = false, silent = false })
api.nvim_set_keymap('n', '[Window]p', ':<C-u>vsplit<CR>:wincmd w<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '[Window]o', ':<C-u>only<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<Tab>', ':wincmd w<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '[Space]l', ':luafile ~/.config/nvim/init.lua<CR>', { noremap = true, silent = false })

function _G.smart_close()
	return vim.fn.winnr("$") ~= 1 and ':' .. t '<C-u>' .. 'close' .. t '<CR>' or ""
end

function t(str)
	return api.nvim_replace_termcodes(str, true, true, true)
end

api.nvim_set_keymap('n', 'q', 'v:lua.smart_close()' or "", { expr = true, noremap = true })


-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
api.nvim_set_keymap('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>", { noremap = true, silent = false })
api.nvim_set_keymap('n', "Dw", ":call vimspector#AddWatch()<cr>", { noremap = true, silent = false })
api.nvim_set_keymap('n', "De", ":call vimspector#Evaluate()<cr>", { noremap = true, silent = false })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '[Space]e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[Space]q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', '[Space]d', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', '[Space]h', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '[Space]wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '[Space]wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '[Space]wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '[Space]t', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '[Space]r', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '[Space]a', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '[Space]n', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '[Space]f', function()
			vim.lsp.buf.format { async = false }
		end, opts)

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
			vim.lsp.handlers.hover,
			{
				border = "single", -- "shadow" , "none", "rounded"
			}
		)

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics, {
				--    underline = false, -- Enable underline, use default values
				virtual_text = true -- Enable virtual text only on Warning or above, override spacing to 2
			}
		)
	end,
})

if vim.lsp.inlay_hint then
	vim.keymap.set('n', '<leader>h', function()
		vim.lsp.inlay_hint(0, nil)
	end, { desc = 'Toggle Inlay Hints' })
end
