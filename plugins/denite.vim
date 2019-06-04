nnoremap <silent> ;r
            \ :<C-u>Denite -buffer-name=register
            \ register neoyank<CR>
xnoremap <silent> ;r
            \ :<C-u>Denite -default-action=replace -buffer-name=register
            \ register neoyank<CR>
nnoremap <silent> [Window]<Space>
            \ :<C-u>Denite file/rec:~/.config/nvim/<CR>
nnoremap <expr> ;s line('$') > 10000 ? '/' :
            \ ":\<C-u>Denite -buffer-name=search -start-filter line\<CR>"
nnoremap <expr> ;n line('$') > 10000 ? 'n' :
            \ ":\<C-u>Denite -buffer-name=search -resume -refresh -no-start-filter\<CR>"
nnoremap <expr> * line('$') > 10000 ? '*' :
            \ ":\<C-u>DeniteCursorWord -buffer-name=search line\<CR>"
nnoremap <silent> [Window]s :<C-u>Denite file/point file/old
            \ -sorters=sorter/rank
            \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`
            \ file file:new<CR>
nnoremap <silent><expr> tt  &filetype == 'help' ?  "g\<C-]>" :
            \ ":\<C-u>DeniteCursorWord -buffer-name=tag -immediately
            \  tag:include\<CR>"
nnoremap <silent><expr> tp  &filetype == 'help' ?
            \ ":\<C-u>pop\<CR>" : ":\<C-u>Denite jump\<CR>"
nnoremap <silent> [Window]n :<C-u>Denite dein<CR>
nnoremap <silent> [Window]g :<C-u>Denite ghq<CR>
nnoremap <silent> ;g :<C-u>Denite -buffer-name=search
            \ -no-empty grep<CR>
nnoremap <silent> ft :<C-u>Denite filetype<CR>
nnoremap <silent> <C-t> :<C-u>Denite
            \ -cursor-pos=`tabpagenr()-1` deol:fish<CR>
nnoremap <silent> <C-k> :<C-u>Denite change jump<CR>
nnoremap <silent> <C-h> :<C-u>DeniteCursorWord help<CR>
nnoremap <silent> [Space]gs :<C-u>Denite gitstatus<CR>
nnoremap <silent> ;;
            \ :<C-u>Denite command command_history<CR>
