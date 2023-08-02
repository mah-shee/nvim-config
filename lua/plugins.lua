vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true }
    use { 'vim-denops/denops.vim' }
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
    use {
        'ayu-theme/ayu-vim',
        config = function()
            vim.cmd [[
            set termguicolors
            let ayucolor="dark"
            autocmd ColorScheme * highlight Comment ctermfg=14 guifg=#8FA0B3
            autocmd ColorScheme * highlight LineNr ctermfg=14 guifg=#8FA0B3
            colorscheme ayu
            highlight Normal ctermbg=NONE guibg=NONE
            highlight NonText ctermbg=NONE guibg=NONE
            highlight SpecialKey ctermbg=NONE guibg=NONE
            highlight LineNr ctermbg=NONE guibg=NONE
            highlight Folded ctermbg=NONE guibg=NONE
            highlight EndOfBuffer ctermbg=NONE guibg=NONE
            ]]
        end,
    }
    use {
        'Shougo/vimproc.vim',
        run = function()
            vim.cmd 'make'
        end,
    }
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
    use {
        'airblade/vim-gitgutter',
        config = function()
            vim.cmd [[source ~/.config/nvim/plugins/gitgutter.vim]]
        end,
    }
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'whonore/Coqtail', ft = 'coq' }
    use {
        'skanehira/preview-uml.vim',
        config = function()
            vim.g.preview_uml_url='http://localhost:8888'
        end,
    }
    use { 'Shougo/ddc.vim' }
    use { 'Shougo/ddc-nvim-lsp' }
    use { 'Shougo/ddc-matcher_head' }
    use { 'Shougo/ddc-sorter_rank' }
    use {
        'matsui54/denops-signature_help',
        requires = { 'Shougo/ddc.vim' },
        config = function()
            vim.cmd 'call signature_help#enable()'
        end,
    }
    use {
        'matsui54/denops-popup-preview.vim',
        requires = { 'Shougo/ddc.vim' },
        config = function()
            vim.cmd 'call popup_preview#enable()'
        end,
    }
    use { 'simrat39/rust-tools.nvim' }
    use { 'puremourning/vimspector' }
end)
