" ==============================================================================
" Extensions to auto install
" ==============================================================================
let g:coc_global_extensions = ['coc-json',
	\ 'coc-git',
	\ 'coc-clangd',
	\ 'coc-python',
	\ 'coc-rls',
	\ 'coc-rust-analyzer',
	\ 'coc-clang-format-style-options',
	\ 'coc-cmake',
	\ 'coc-css',
	\ 'coc-emmet',
	\ 'coc-html',
	\ 'coc-html-css-support',
	\ 'coc-markdownlint',
	\ 'coc-sh',
	\ 'coc-snippets',
	\ 'coc-spell-checker',
	\ 'coc-svg',
	\ 'coc-yaml',
	\ 'coc-glslx',
	\ 'coc-xml' ]

" ==============================================================================
" General Settings
" ==============================================================================
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
xmap <leader>gf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup CocDisableForCertainFiletypes
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave COMMIT_EDITMSG CocDisable
augroup END

let g:coc_show_warning_highlights = 1
function! TriggerCocWarnings()
	" Turn off warning highlighting
	if g:coc_show_warning_highlights == 1
		let g:coc_show_warning_highlights = 0
		highlight! link CocWarningHighlight SomeDummyThingForCocThatLinksToNothing
	else
		let g:coc_show_warning_highlights = 1
		highlight link CocWarningHighlight NONE
	endif
endfunction
nmap <leader>cw :call TriggerCocWarnings()<CR>
