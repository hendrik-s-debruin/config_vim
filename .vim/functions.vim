" This file keeps all custom functions and commands for vim

" Reload configuration
command! Rebash source ~/.vimrc

" RangerChooser
function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()

" C headers
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

function! SecMajor(border_char)
	let l:line = substitute(getline('.'), "^[ 	]*", "", "")
	let l:max_cols = &textwidth

	" length of the comment chars
	" -2 because commentstring contains '%s' literal
	let l:comment_len = len(&commentstring) - 2

	" Check the &commentstring pattern to see if comments only start a line, or
	" whether they also end the line
	if &commentstring =~ '%s$'
		let l:comment_has_trailing_chars = 0
	else
		let l:comment_has_trailing_chars = 1
	endif

	let l:current_line_number = getcurpos()[1]
	let l:current_indentation_in_spaces = indent(l:current_line_number)

	if &expandtab " if tabbing with spaces
		let l:tab_chars = repeat(" ", l:current_indentation_in_spaces)
	else " else if tabbing with tab chars
		let l:tab_chars = repeat("\t", l:current_indentation_in_spaces/&shiftwidth)
	endif


	if l:comment_has_trailing_chars
		let l:border = " " . repeat(a:border_char, l:max_cols - l:comment_len - 2 - l:current_indentation_in_spaces) . " "
		let l:space_len = l:max_cols - l:comment_len - len(l:line) - 1 - l:current_indentation_in_spaces
		let l:output_line =  " " . l:line . repeat(" ", l:space_len)
	else
		let l:border = " " . repeat(a:border_char, l:max_cols - l:comment_len -1 - l:current_indentation_in_spaces)
		let l:output_line = " " . l:line
	endif


	let l:output = printf(&commentstring, l:border)
	let l:failed = append(line('.'), l:tab_chars . l:output)

	let l:output = printf(&commentstring, l:output_line)
	let l:failed = append(line('.'), l:tab_chars . l:output)

	let l:output = printf(&commentstring, l:border)
	let l:failed = append(line('.'), l:tab_chars . l:output)

	execute ':normal! dd'
endfunction

function! SecMinor(border_char)
	let l:line = substitute(getline('.'), "^[ 	]*", "", "")
	let l:max_cols = &textwidth

	" length of the comment chars
	" -2 because commentstring contains '%s' literal
	let l:comment_len = len(&commentstring) - 2

	let l:current_line_number = getcurpos()[1]
	let l:current_indentation_in_spaces = indent(l:current_line_number)

	if &expandtab " if tabbing with spaces
		let l:tab_chars = repeat(" ", l:current_indentation_in_spaces)
	else " else if tabbing with tab chars
		let l:tab_chars = repeat("\t", l:current_indentation_in_spaces/&shiftwidth)
	endif

	" Check the &commentstring pattern to see if comments only start a line, or
	" whether they also end the line
	if &commentstring =~ '%s$'
		let l:comment_has_trailing_chars = 0
	else
		let l:comment_has_trailing_chars = 1
	endif

	if l:comment_has_trailing_chars
		let l:border_flank_double = (l:max_cols - len(l:line) - l:comment_len  - 4 - l:current_indentation_in_spaces)
		if l:border_flank_double % 2
			let l:border_flank_left = l:border_flank_double / 2
			let l:border_flank_right = l:border_flank_left + 1
		else
			let l:border_flank_left = l:border_flank_double / 2
			let l:border_flank_right = l:border_flank_left
		endif

		let l:output_line = " " . repeat(a:border_char, l:border_flank_left) . " " . l:line . " " . repeat(a:border_char, l:border_flank_right) . " "
	else
		let l:border_flank_double = (l:max_cols - len(l:line) - l:comment_len  - 3 - l:current_indentation_in_spaces)
		if l:border_flank_double % 2
			let l:border_flank_left = l:border_flank_double / 2
			let l:border_flank_right = l:border_flank_left + 1
		else
			let l:border_flank_left = l:border_flank_double / 2
			let l:border_flank_right = l:border_flank_left
		endif
		let l:output_line = " " . repeat(a:border_char, l:border_flank_left) . " " . l:line . " " . repeat(a:border_char, l:border_flank_right)
	endif

	let l:output = l:tab_chars . printf(&commentstring, l:output_line)
	let l:failed = append(line('.'), l:output)

	execute ':normal! dd'
endfunction
