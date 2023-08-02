vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true }
--    use { 'vim-denops/denops.vim' }
    use {
        'easymotion/vim-easymotion',
        config = function()
            vim.cmd [[source ~/.config/nvim/plugins/easymotion.vim]]
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
    use { 'thinca/vim-themis' }
    use {
        'sheerun/vim-polyglot',
        config = function()
            vim.g.polyglot_disabled = {'markdown', 'tsx', 'typescript'}
        end,
    }
	use { "bluz71/vim-moonfly-colors", as = "moonfly" }
	use { 'xiyaowong/transparent.nvim'}

    use { 'hoob3rt/lualine.nvim' }
    use {
        'yggdroot/indentline',
        config = function()
            vim.g.indentline_char = '¦'
        end,
    }
    use {
        'tpope/vim-fugitive',
        config = function()
            vim.cmd [[source ~/.config/nvim/plugins/fugitive.vim]]
        end,
    }

	use { 'lewis6991/gitsigns.nvim' }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'simrat39/rust-tools.nvim' }
    use { 'puremourning/vimspector' }
    use {
        'rhysd/accelerated-jk',
        config = function()
            vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {silent = true})
            vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {silent = true})
        end,
    }

    use {
        'tpope/vim-surround',
        event = 'InsertEnter',
    }

    use {
        'cohama/lexima.vim',
        event = 'InsertEnter',
    }
end)
