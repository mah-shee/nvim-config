vim.o.secure=false
vim.o.hidden=false
vim.o.number=false
vim.o.autoindent=true
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.expandtab=false
vim.o.smarttab=true
vim.o.shiftround=false
vim.o.splitright=false
vim.o.cursorline=false
-- vim.o.clipboard=unnamed
vim.o.textwidth=0 
-- vim.o.listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
vim.o.conceallevel=0
-- vim.o.signcolumn=yes
-- Disable modeline.
vim.o.modelines=0
-- autocmd MyAutoCmd BufRead,BufWritePost *.txt setlocal modelines=5 modeline





-- Highlight <>.
-- vim.o.matchpairs+=<:>

-- Use vimgrep.
-- vim.o.grepprg=internal
-- Use grep.
-- vim.o.grepprg=grep\ -inH

-- Exclude = from isfilename.
-- vim.o.isfname-==

-- Keymapping timeout.
-- vim.o.timeout timeoutlen=3000 ttimeoutlen=100

-- CursorHold time.
vim.o.updatetime=100

-- Set swap directory.
-- vim.o.directory-=.

-- Set undofile.
-- vim.o.undofile
-- let &g:undodir = &directory

-- Enable virtualedit in visual block mode.
-- vim.o.virtualedit=block

-- Set keyword help.
-- vim.o.keywordprg=:help

--[[ Disable paste.
autocmd MyAutoCmd InsertLeave *
      \ if &paste | setlocal nopaste | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif

]]

-- Update diff.
-- autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

-- Do not display the completion messages
-- vim.o.noshowmode

-- Disable packpath
-- vim.o.packpath=

--[[
if has('nvim')
  -- Display candidates by popup menu.
  vim.o.wildmenu
  vim.o.wildmode=full
  vim.o.wildoptions+=pum
else
  -- Display candidates by list.
  vim.o.nowildmenu
  vim.o.wildmode=list:longest,full
endif
]]
-- Increase history amount.

vim.o.history=1000

-- Display all the information of the tag by the supplement of the Insert mode.
-- vim.o.showfulltag
-- Can supplement a tag in a command-line.
-- vim.o.wildoptions+=tagfile
--[[
if has('nvim')
  vim.o.shada=!,'300,<50,s10,h
else
  vim.o.viminfo=!,'300,<50,s10,h
endif
]]

-- Disable menu
-- g:did_install_default_menus = 1

-- Completion setting.
-- vim.o.completeopt=noinsert,menuone,noselect
-- Don't complete from other buffer.
-- vim.o.complete=.
-- Set popup menu max height.
vim.o.pumheight=20

-- Report changes.
vim.o.report=0

-- Maintain a current line at the time of movement as much as possible.
-- vim.o.nostartofline

-- Splitting a window will put the new window below the current one.
-- vim.o.splitbelow
-- Splitting a window will put the new window right the current one.
-- vim.o.splitright
-- Set minimal width for current window.
vim.o.winwidth=30
-- Set minimal height for current window.
-- vim.o.winheight=20
vim.o.winheight=1
-- Set maximam maximam command line window.
vim.o.cmdwinheight=5
-- No equal window size.
-- vim.o.noequalalways

-- Adjust window size of preview and help.
vim.o.previewheight=8
vim.o.helpheight=12

-- vim.o.ttyfast

-- When a line is long, do not omit it in @.
-- vim.o.display=lastline
-- Display an invisible letter with hex format.
-- vim.o.display+=uhex

-- For conceal.
vim.o.conceallevel=2 
-- vim.o.concealcursor=niv

-- vim.o.colorcolumn=79
--[[
if exists('&inccommand')
  vim.o.inccommand=nosplit
endif

if exists('&pumblend')
  vim.o.pumblend=20
  -- For gonvim
  autocmd MyAutoCmd InsertEnter * vim.o.pumblend=20
endif

]]
-- Use cursor shape feature

-- let g:terminal_scrollback_buffer_size = 3000
--[[
---------------------------------------------------------------------------
-- Disable default plugins

-- Disable menu.vim
if has('gui_running')
   vim.o.guioptions=Mc
endif

let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_man               = 1
let g:loaded_matchit           = 1
let g:loaded_matchparen        = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_rrhelper          = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tarPlugin         = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zipPlugin         = 1
]]
