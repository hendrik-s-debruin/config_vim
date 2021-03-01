xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Taken from here
" https://github.com/junegunn/vim-easy-align/blob/master/EXAMPLES.md#aligning-in-line-comments
if !exists('g:easy_align_delimiters')
	let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
