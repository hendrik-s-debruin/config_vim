" General settings

set spell
map k gk
map j gj

set formatoptions=""
set formatoptions+=n " format numbered lists
set formatoptions+=t " break lines at text width

" Functions
function! MarkdownCodeBlock()
	let l:max_cols = &textwidth
	let l:line = getline('.')

	let l:prepend_num = l:max_cols - strchars(l:line) - 3
	let l:prepend = repeat('~', l:prepend_num)

	let l:failed = append(line('.'), l:prepend . '{.' . l:line . '}')

	" Remove the old line
	execute ':normal! dd'

	let l:f = append(line('.'), repeat('~', l:max_cols))

endfunction

function! MarkdownSectionMajor(underline_char)
	let l:max_cols = &textwidth
	let l:output = repeat(a:underline_char, l:max_cols)
	let l:failed = append(line('.'), l:output)
endfunction

function! MarkdownSectionMinor(level)
	let l:max_cols = &textwidth 
	let l:line = getline('.')

	let l:append_num = l:max_cols - a:level - strchars(l:line) - 2
	let l:prepend = repeat('#', a:level)
	let l:append = repeat('#', l:append_num)

	let l:failed = append(line('.'), l:prepend . ' ' . l:line . ' ' . l:append)

	execute ':normal! dd'
endfunction!

" Bindings
noremap <leader>c :call MarkdownCodeBlock()<Enter>
noremap <leader>s1 :call MarkdownSectionMajor('=')<Enter>
noremap <leader>s2 :call MarkdownSectionMajor('-')<Enter>
noremap <leader>s3 :call MarkdownSectionMinor(3)<Enter>
noremap <leader>s4 :call MarkdownSectionMinor(4)<Enter>
noremap <leader>s5 :call MarkdownSectionMinor(5)<Enter>
noremap <leader>s6 :call MarkdownSectionMinor(6)<Enter>
