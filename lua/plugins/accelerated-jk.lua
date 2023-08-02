vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})

require('accelerated-jk').setup({
    mode = 'time_driven',
    enable_deceleration = false,
    acceleration_motions = {},
    acceleration_limit = 500, -- 最大の加速度をさらに増やします
    acceleration_table = { 3,6,9,12,15,18,21,24,27,30 }, -- より頻繁に加速を開始します
    deceleration_table = { {150, 9999} }
})
