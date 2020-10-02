" rainbow does not play nicely with vim-cmake-syntax
function! ConditionalStartRainbowPlugin()
	if &ft == "cmake"
		:RainbowToggleOff
	else
		:RainbowToggleOn
	endif
endfunction

augroup EnableRainbowPlugin
	autocmd!
	autocmd BufEnter * :call ConditionalStartRainbowPlugin()
augroup END

let g:rainbow_active = 1
packadd rainbow

