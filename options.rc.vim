:command! UP call dein#remote_plugins()
:command! CH checkhealth
:command! Tnew tabnew | terminal

highlight! Normal ctermbg=NONE guibg=NONE
highlight! NonText ctermbg=NONE guibg=NONE
highlight! LineNr ctermbg=NONE guibg=NONE

set hidden
set number
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set shiftround
set splitright
set cursorline
set clipboard=unnamed
set hls
set list
set wrap
set textwidth=0 
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set conceallevel=0
set nohlsearch
set signcolumn=yes
" Disable modeline.
set modelines=0
set nomodeline
" autocmd MyAutoCmd BufRead,BufWritePost *.txt setlocal modelines=5 modeline

" Use clipboard register.

let g:python_host_prog = system("echo -n (pyenv root)/versions/(pyenv global | grep '^2')/bin/python")
let g:python3_host_prog = system("echo -n (pyenv root)/versions/(pyenv global | grep '^3')/bin/python")

" if (!has('nvim') || $DISPLAY != '') && has('clipboard')
"   if has('unnamedplus')
"      set clipboard& clipboard+=unnamedplus
"   else
"      set clipboard& clipboard+=unnamed
"   endif
" endif


" Highlight <>.
set matchpairs+=<:>

" FastFold
" autocmd MyAutoCmd TextChangedI,TextChanged *
"       \ if &l:foldenable && &l:foldmethod !=# 'manual' |
"       \   let b:foldmethod_save = &l:foldmethod |
"       \   let &l:foldmethod = 'manual' |
"       \ endif
" autocmd MyAutoCmd BufWritePost *
"       \ if &l:foldmethod ==# 'manual' && exists('b:foldmethod_save') |
"       \   let &l:foldmethod = b:foldmethod_save |
"       \   execute 'normal! zx' |
"       \ endif

if exists('*FoldCCtext')
  " Use FoldCCtext().
  set foldtext=FoldCCtext()
endif

" Use vimgrep.
" set grepprg=internal
" Use grep.
set grepprg=grep\ -inH

" Exclude = from isfilename.
set isfname-==

" Keymapping timeout.
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time.
set updatetime=100

" Set swap directory.
set directory-=.

" Set undofile.
set undofile
let &g:undodir = &directory

" Enable virtualedit in visual block mode.
set virtualedit=block

" Set keyword help.
set keywordprg=:help

" Disable paste.
autocmd MyAutoCmd InsertLeave *
      \ if &paste | setlocal nopaste | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif

" Update diff.
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

" if has('patch-8.1.0360')
"   set diffopt=internal,algorithm:patience,indent-heuristic
" endif

" Make directory automatically.
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/

autocmd MyAutoCmd BufWritePre *
      \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force) abort
  if !isdirectory(a:dir) && &l:buftype == '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" Use autofmt.
" set formatexpr=autofmt#japanese#formatexpr()

" Do not display the completion messages
set noshowmode
" if has('patch-7.4.314')
"   set shortmess+=c
" else
"   autocmd MyAutoCmd VimEnter *
"         \ highlight ModeMsg guifg=bg guibg=bg |
"         \ highlight Question guifg=bg guibg=bg
" endif
" 
" " Do not display the edit messages
" if has('patch-7.4.1570')
"   set shortmess+=F
" endif


" Disable packpath
set packpath=

if has('nvim')
  " Display candidates by popup menu.
  set wildmenu
  set wildmode=full
  set wildoptions+=pum
else
  " Display candidates by list.
  set nowildmenu
  set wildmode=list:longest,full
endif
" Increase history amount.
set history=1000
" Display all the information of the tag by the supplement of the Insert mode.
set showfulltag
" Can supplement a tag in a command-line.
set wildoptions+=tagfile

if has('nvim')
  set shada=!,'300,<50,s10,h
else
  set viminfo=!,'300,<50,s10,h
endif

" Disable menu
let g:did_install_default_menus = 1

" Completion setting.
set completeopt=noinsert,menuone,noselect
" Don't complete from other buffer.
set complete=.
" Set popup menu max height.
set pumheight=20

" Report changes.
set report=0

" Maintain a current line at the time of movement as much as possible.
set nostartofline

" Splitting a window will put the new window below the current one.
set splitbelow
" Splitting a window will put the new window right the current one.
set splitright
" Set minimal width for current window.
set winwidth=30
" Set minimal height for current window.
" set winheight=20
set winheight=1
" Set maximam maximam command line window.
set cmdwinheight=5
" No equal window size.
set noequalalways

" Adjust window size of preview and help.
set previewheight=8
set helpheight=12

set ttyfast

" When a line is long, do not omit it in @.
set display=lastline
" Display an invisible letter with hex format.
"set display+=uhex

" For conceal.
set conceallevel=2 concealcursor=niv

set colorcolumn=79

if exists('&inccommand')
  set inccommand=nosplit
endif

if exists('&pumblend')
  set pumblend=20
  " For gonvim
  autocmd MyAutoCmd InsertEnter * set pumblend=20
endif

" Use cursor shape feature
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Share the histories
" autocmd MyAutoCmd FocusGained *
"      \ if exists(':rshada') | rshada | wshada | endif

" autocmd MyAutoCmd FocusGained * checktime

" Modifiable terminal
" autocmd MyAutoCmd TermOpen * setlocal modifiable
" autocmd MyAutoCmd TermClose * buffer #

let g:terminal_scrollback_buffer_size = 3000

"---------------------------------------------------------------------------
" Disable default plugins

" Disable menu.vim
if has('gui_running')
   set guioptions=Mc
endif

let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_man               = 1
let g:loaded_matchit           = 1
let g:loaded_matchparen        = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_rrhelper          = 1
let g:loaded_shada_plugin      = 1
let g:loaded_spellfile_plugin  = 1
let g:loaded_tarPlugin         = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zipPlugin         = 1
