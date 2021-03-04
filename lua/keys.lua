local api = vim.api

vim.g.mapleader = ","
api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent = false})
-- api.nvim_set_keymap('t', '<Esc>', '<C-\><C-n>', {noremap = true, silent = false})
vim.cmd('autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %')
-- for deoplete to leave the preview window always closed
vim.cmd('autocmd InsertLeave * set nopaste')

-- Insert mode keymappings:
api.nvim_set_keymap('i', '<C-t>', '<C-v><TAB>', {noremap=true, silent=true})
-- Enable undo <C-w> and <C-u>.
api.nvim_set_keymap('i', '<C-w>', '<C-g><C-w>', {noremap=true, silent=true})
api.nvim_set_keymap('i', '<C-u>', '<C-g><C-u>', {noremap=true, silent=true})

-- Use ',' instead of '\'.
-- Use <Leader> in global plugin.
-- Use <LocalLeader> in filetype plugin.
vim.g.maplocalleader = 'm'

-- Release keymappings for plug-in.
api.nvim_set_keymap('n', ';', '<Nop>', {noremap = true, silent = false})
api.nvim_set_keymap('n', 'm', '<Nop>', {noremap = true, silent = false})
api.nvim_set_keymap('n', ',', '<Nop>', {noremap = true, silent = false})

-- [Space]: Other useful commands
-- Smart space mapping.
api.nvim_set_keymap('n', ' ', '[Space]', {noremap=false, silent=false})
api.nvim_set_keymap('n', '[Space]', '<Nop>', {noremap = true, silent = false})


-- Set autoread.
api.nvim_set_keymap('n', '[Space]ar', ':<C-u>call vimrc#toggle_option("autoread")<CR>', {noremap = true, silent = false})
-- Set spell check.
--[[ nnoremap [Space]p
      \ :<C-u>call vimrc#toggle_option('spell')<CR>
      \: set spelllang=en_us<CR>
      \: set spelllang+=cjk<CR>
]]
api.nvim_set_keymap('n', '[Space]w', ':<C-u>call vimrc#toggle_option("wrap")<CR>', {noremap = true, silent = false})


-- Useful save mappings.
api.nvim_set_keymap('n', '<Leader><Leader>', ':<C-u>update<CR>', {noremap = true, silent = false})

-- s: Windows and buffers(High priority)
-- The prefix key.
api.nvim_set_keymap('n', '[Window]', '<Nop>', {noremap = true, silent = false})
api.nvim_set_keymap('n', 's', '[Window]', {noremap=false, silent=false})
api.nvim_set_keymap('n', '[Window]p', ':<C-u>vsplit<CR>:wincmd w<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '[Window]o', ':<C-u>only<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<Tab>', ':wincmd w<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '[Space]l', ':luafile ~/.config/nvim/init.lua<CR>', {noremap = true, silent = false})

function _G.smart_close() 
      return vim.fn.winnr("$") ~= 1 and ':'..t'<C-u>'..'close'..t'<CR>' or ""
end

function t(str)
      return api.nvim_replace_termcodes(str, true, true, true)
end

api.nvim_set_keymap('n', 'q', 'v:lua.smart_close()'or "", {expr=true, noremap = true})

-- Easily edit .vimrc
api.nvim_set_keymap('n', '[Space]ev', ':<C-u>edit $MYVIMRC<CR>', {noremap = true, silent =true})
