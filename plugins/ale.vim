  let g:ale_sign_error = '⨉'
  let g:ale_sign_warning = '⚠'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_sign_column_always = 1
  
  let g:ale_lint_on_enter = 1
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 'never'
  
  let g:ale_set_loclist = 0
  let g:ale_set_quickfix = 0
  let g:ale_open_list = 0
  let g:ale_keep_list_window_open = 0
  
  let g:ale_linters = {
  \ 'python': ['flake8'],
  \ }
  
  let g:ale_fixers = {
  \ 'python': ['autopep8', 'black', 'isort'],
  \ }

  " 各ツールの実行オプションを変更してPythonパスを固定
  let g:ale_python_flake8_executable = g:python3_host_prog
  let g:ale_python_flake8_options = '-m flake8'
  let g:ale_python_autopep8_executable = g:python3_host_prog
  let g:ale_python_autopep8_options = '-m autopep8'
  let g:ale_python_isort_executable = g:python3_host_prog
  let g:ale_python_isort_options = '-m isort'
  let g:ale_python_black_executable = g:python3_host_prog
  let g:ale_python_black_options = '-m black'
  
  " ついでにFixを実行するマッピングしとく
  nmap <silent> <Leader>x <Plug>(ale_fix)
  " ファイル保存時に自動的にFixするオプションもあるのでお好みで
  let g:ale_fix_on_save = 1

  nmap [ale] <Nop>
  map <C-k> [ale]
  nmap <silent> [ale]<C-P> <Plug>(ale_previous)
  nmap <silent> [ale]<C-N> <Plug>(ale_next)
