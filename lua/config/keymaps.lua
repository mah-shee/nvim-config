local api = vim.api

-- Use ',' instead of '\'.
vim.g.mapleader = ","
-- Use <Leader> in global plugin.
-- Use <LocalLeader> in filetype plugin.
vim.g.maplocalleader = 'm'

api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent = false})
-- api.nvim_set_keymap('t', '<Esc>', '<C-\><C-n>', {noremap = true, silent = false})

-- Insert mode keymappings:
api.nvim_set_keymap('i', '<C-t>', '<C-v><TAB>', {noremap=true, silent=true})
-- Enable undo <C-w> and <C-u>.
api.nvim_set_keymap('i', '<C-w>', '<C-g><C-w>', {noremap=true, silent=true})
api.nvim_set_keymap('i', '<C-u>', '<C-g><C-u>', {noremap=true, silent=true})


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

-- Start Terminal
api.nvim_set_keymap('n', '[Window]t', ':<C-u>T<CR>', {noremap = true, silent = false})
vim.cmd [[
  command! T lua TerminalCommand()
]]

function _G.TerminalCommand()
  vim.cmd('split')
  vim.cmd('wincmd j')
  vim.cmd('resize 20')
  vim.cmd('terminal ')
end
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

vim.api.nvim_exec([[
  autocmd TermOpen * startinsert
]], false)

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


-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
api.nvim_set_keymap('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>", {noremap=true, silent=false})
api.nvim_set_keymap('n', "Dw", ":call vimspector#AddWatch()<cr>", {noremap=true, silent=false})
api.nvim_set_keymap('n', "De", ":call vimspector#Evaluate()<cr>", {noremap=true, silent=false})
