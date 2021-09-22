" ==============================================================================
" Settings
" ==============================================================================
" Do not use the default comment of /* <comment> */
setlocal commentstring=//%s

" Continue doxygen comments
setlocal comments^=:///

" ==============================================================================
" Functions
" ==============================================================================
" ------------------------------------------------------------------------------
" C headers
" ------------------------------------------------------------------------------
function! IncludeCHeader()
	let l:line = getline('.')
	let l:output = '#include "' . l:line . '"'
	let l:failed = append(line('.'), l:output)

	" Remove the old line
	execute ':normal! dd'
endfunction

function! IncludeCSystemHeader()
	let l:line = getline('.')
	let l:output = '#include <' . l:line . '>'
	let l:failed = append(line('.'), l:output)

	" Remove the old line
	execute ':normal! dd'
endfunction


" ==============================================================================
" Bindings
" ==============================================================================
noremap <buffer> <leader>i :call IncludeCHeader()<Enter>
noremap <buffer> <leader>I :call IncludeCSystemHeader()<Enter>
