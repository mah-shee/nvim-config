local api = vim.api

-- 自動で dein#recache_runtimepath() する
-- vim.api.nvim_set_var('dein#auto_recache', 1)
-- neovimのリモートプラグインを遅延読み込み
-- vim.api.nvim_set_var('dein#lazy_rplugins', 1)
vim.api.nvim_set_var('dein#enable_notification', 1)
vim.api.nvim_set_var('dein#install_max_processes', 16)
vim.api.nvim_set_var('dein#install_message_type', 'none')
vim.api.nvim_set_var('dein#enable_notification', 1)

api.nvim_set_var('dein#install_github_api_token', os.getenv('DEIN_GITHUB_TOKEN'))


local dein_dir = vim.fn.expand('~/.cache/dein')
local dein_repo_dir = dein_dir..'/repos/github.com/Shougo/dein.vim'

if not string.match(vim.o.runtimepath, '/dein.vim') then
  if not (vim.fn.isdirectory(dein_repo_dir) ~= 1) then
    os.execute('git clone https://github.com/Shougo/dein.vim '..dein_repo_dir)
  end
  vim.o.runtimepath = dein_repo_dir..','..vim.o.runtimepath
end

if (vim.fn['dein#load_state'](dein_dir) == 1) then
  local rc_dir = vim.fn.expand('~/.config/nvim')
  local toml = rc_dir..'/dein.toml'
  local filetype = rc_dir..'/deinft.toml'
  local lazy_toml = rc_dir..'/dein_lazy.toml'
  vim.fn['dein#begin'](dein_dir)
  vim.fn['dein#load_toml'](toml, { lazy = 0 })
  vim.fn['dein#load_toml'](filetype, { lazy = 0 })
  vim.fn['dein#load_toml'](lazy_toml, { lazy = 1 })
  vim.fn['dein#end']()
  vim.fn['dein#save_state']()
end

if (vim.fn['dein#check_install']() ~= 0) then
  vim.fn['dein#install']()
end

local removed_plugins = vim.fn['dein#check_clean']()
if vim.fn.len(removed_plugins) > 0 then
  vim.fn.map(removed_plugins, "delete(v:val, 'rf')")
  vim.fn['dein#recache_runtimepath']()
end

vim.g['dein#install_progress_type'] = 'title'
vim.g['dein#enable_notification'] = 1
vim.g['dein#notification_icon'] = '~/.config/nvim/signs/warn.png'
vim.g['dein#install_log_filename'] = '~/dein.log'
