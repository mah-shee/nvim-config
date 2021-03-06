function! s:source_rc(path, ...) abort
    let use_global = get(a:000, 0, !has('vim_starting'))
    let abspath = resolve(expand('~/.config/nvim/' . a:path))
    if !use_global
        execute 'source' fnameescape(abspath)
        return
    endif

" dein configurations.
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let g:dein#notification_icon = '~/.config/nvim/signs/warn.png'
let g:dein#install_log_filename = '~/dein.log'

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
 if !isdirectory(s:dein_repo_dir)
 execute '!git clone https://github.com/shougo/dein.vim' s:dein_repo_dir
 endif
 execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:dein_toml = '~/.config/nvim/dein.toml'
  let s:dein_lazy_toml = '~/.config/nvim/dein_lazy.toml'
  let s:dein_ft_toml = '~/.config/nvim/deinft.toml'
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy' : 1})
  call dein#load_toml(s:dein_ft_toml)

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
 call dein#install()
endif

augroup MyAutoCmd
    autocmd!
    autocmd FileType,Syntax,BufNewFile,BufNew,BufRead *?
                \ call vimrc#on_filetype()
    autocmd CursorHold *.toml syntax sync minlines=300
augroup END

call s:source_rc('keymap.rc.vim')

if has('vim_starting')
    call s:source_rc('init.rc.vim')
endif

" call s:source_rc('dein_api_token.vim')
call s:source_rc('dein.rc.vim')

if has('vim_starting') && !empty(argv())
    call vimrc#on_filetype()
endif

if !has('vim_starting')
    call dein#call_hook('source')
    call dein#call_hook('post_source')
endif

call s:source_rc('options.rc.vim')
