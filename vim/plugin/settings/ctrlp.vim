if executable('ag')
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 100000
