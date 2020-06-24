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
