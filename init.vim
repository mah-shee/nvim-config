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
  call dein#load_toml(s:dein_toml, {'lazy': 0})


  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
 call dein#install()
endif


if !has('vim_starting')
  call dein#call_hook('source')
  call dein#call_hook('post_source')
endif
