local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
	{
		import = "plugins",
		defaults = {
			lazy = true,
			version = false, -- always use the latest git commit
		},
		install = { colorscheme = { "tokyonight" } },
		checker = { enabled = false }, -- automatically check for plugin updates
		change_detection = {
			enabled = false,
			notify = false, -- get a notification when changes are found
		},

		performance = {
			cache = {
				enabled = true,
			},
			rtp = {

				-- disable some rtp plugins
				disabled_plugins = {
					"gzip",
					"matchit",
					"matchparen",
					"netrwPlugin",
					-- 	"tarPlugin",
					-- 	"tohtml",
					-- 	"tutor",
					-- 	"zipPlugin",
				},
			},
		},
	}
)
