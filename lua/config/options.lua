vim.o.secure = false
vim.o.hidden = false
vim.wo.number = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.smarttab = true
vim.o.shiftround = false
vim.o.splitright = false
vim.o.cursorline = true
vim.o.textwidth = 0
vim.wo.listchars = 'tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲'
vim.o.conceallevel = 0
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.api.nvim_win_set_option(0, 'signcolumn', 'yes:1')
-- Disable modeline.
vim.o.modelines = 0
vim.o.pumblend = 20
vim.o.bs = "indent,eol,start"
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.updatetime = 50
vim.o.history = 1000
vim.o.pumheight = 20
vim.o.report = 0
vim.o.winwidth = 30
vim.o.winheight = 1
vim.o.cmdwinheight = 5
vim.o.previewheight = 8
vim.o.helpheight = 12
-- Vimspector options
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
