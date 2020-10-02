let g:SourceTrailServerIsOn = 0
function! SourceTrailToggleServer()
	if g:SourceTrailServerIsOn == 1
		:SourcetrailStopServer
		let g:SourceTrailServerIsOn = 0
		echo "Disabling Source Trail Server"
	else
		:SourcetrailStartServer
		let g:SourceTrailServerIsOn = 1
		echo "Enabling Source Trail Server"
	endif
endfunction
nnoremap <leader>aaa   :call SourceTrailToggleServer()<Enter>
nnoremap <leader>aa    :SourcetrailRefresh<CR>
nnoremap <leader>as    :SourcetrailActivateToken<CR>
nnoremap <C-LeftMouse> :SourcetrailActivateToken<CR>
