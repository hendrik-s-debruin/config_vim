" use ag if available
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
