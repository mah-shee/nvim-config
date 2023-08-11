require("nvim-tree").setup()

-- nvim-tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':NvimTreeFindFile<CR>', {silent = true, noremap = true})
