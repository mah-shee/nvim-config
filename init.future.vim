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
 let g:rc_dir = expand('~/.vim/dein')
 let s:toml = g:rc_dir . '/dein.toml'
 let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
 let s:ft_toml = g:rc_dir . '/deinft.toml'
 call dein#load_toml(s:toml, {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1})
 call dein#load_toml(s:ft_toml, {'lazy': 1})

 call dein#end()
 call dein#save_state()
endif

if dein#check_install()
 call dein#install()
endif

call s:source_rc('keymap.rc.vim')
