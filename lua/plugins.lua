vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true }
	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
	}
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use {
		'j-hui/fidget.nvim',
		tag = 'legacy',
		config = function()
			require("fidget").setup {
				-- options
			}
		end,
	}
	use { 'github/copilot.vim' }
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'Shougo/context_filetype.vim' }
    use { 'Shougo/neosnippet-snippets' }
	use { "folke/tokyonight.nvim",}
	use { 'xiyaowong/transparent.nvim'}
    use { 'hoob3rt/lualine.nvim' }
	use { "lukas-reineke/indent-blankline.nvim" }
	use { 'lewis6991/gitsigns.nvim' }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'nvim-telescope/telescope.nvim' }
	use { 'HiPhish/nvim-ts-rainbow2' }
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'simrat39/rust-tools.nvim' }
    use { 'puremourning/vimspector' }
	use { 'rainbowhxch/accelerated-jk.nvim' }
    use {
        'tpope/vim-surround',
        event = 'InsertEnter',
    }
    use {
        'cohama/lexima.vim',
        event = 'InsertEnter',
    }
end)
