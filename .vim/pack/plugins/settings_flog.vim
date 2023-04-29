" Show git log graph with format: [hash] {author name} (branch name) message
nnoremap <leader>gl :Flog -format=[%h]\ %d\ %s<CR>

augroup flog
	" Default rebase command is weird, remap it to something more sensible
	autocmd FileType floggraph nno <buffer> ri :exec flog#Format('Floggit rebase --interactive %h')<CR>

	autocmd FileType floggraph nno <buffer> cp :exec flog#Format('Floggit cherry-pick %h')<CR>
	autocmd FileType floggraph nno <buffer> mm :exec flog#Format('Floggit merge %b')<CR>
	autocmd FileType floggraph nno <buffer> mf :exec flog#Format('Floggit merge --ff %b')<CR>
	autocmd FileType floggraph nno <buffer> rH :exec flog#Format('Floggit reset --hard %h')<CR>
augroup END
