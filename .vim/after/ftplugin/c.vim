" ==============================================================================
" Settings
" ==============================================================================
" Do not use the default comment of /* <comment> */
set commentstring=//%s

" Continue doxygen comments
set comments^=:///

set spell

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
noremap <leader>i :call IncludeCHeader()<Enter>
noremap <leader>I :call IncludeCSystemHeader()<Enter>
