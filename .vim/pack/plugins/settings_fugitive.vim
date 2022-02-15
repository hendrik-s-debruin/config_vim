nnoremap <leader>gb :Git blame<Enter>
nnoremap <leader>ge :Gedit %<Enter>

" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
" auto remove fugitive buffers each time you close them
autocmd BufReadPost fugitive://* set bufhidden=delete
