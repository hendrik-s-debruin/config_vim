" ==============================================================================
" Extensions to auto install
" ==============================================================================
let g:coc_global_extensions = ['coc-json',
	\ '@yaegassy/coc-ruff',
	\ 'coc-tsserver',
	\ 'coc-git',
	\ 'coc-clangd',
	\ 'coc-pyright',
	\ 'coc-go',
	\ 'coc-rust-analyzer',
	\ 'coc-clang-format-style-options',
	\ 'coc-cmake',
	\ 'coc-css',
	\ 'coc-svelte',
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
	\ 'coc-java',
	\ 'coc-xml' ]

autocmd FileType python let b:coc_root_patterns = ['.git', '.venv']

" add auto-import to coc for python
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" ==============================================================================
" General Settings
" ==============================================================================
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
xmap <leader>gf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-fix-current)
nmap <leader>cr :CocRestart<Enter>
nmap <leader>cd :CocDiagnostics<Enter>

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

" ==============================================================================
" Python Settings
" ==============================================================================
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']
