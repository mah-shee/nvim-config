-- local ddc = require('ddc.vim')

-- ddc.custom.patch_global('sourceOptions', {'_': {'matchers': ['matcher_head'],'sorters': ['sorter_rank']}})

vim.cmd [[ 
  call ddc#custom#patch_global('sourceOptions', {
        \ '_': {
        \   'matchers': ['matcher_head'],
        \   'sorters': ['sorter_rank']},
        \ })

  call ddc#custom#patch_global('sources', ['nvim-lsp'])
  call ddc#custom#patch_global('sourceOptions', {
        \ 'nvim-lsp': {
        \   'mark': 'lsp',
        \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
        \ })

  call ddc#enable()
]]
