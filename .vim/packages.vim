" This file loads plugins. It is also responsible for setting any plugin-related
" bindings or settings

" Plugins are loaded manually. This way, they may be selectively enabled or
" disabled in future
" ==============================================================================
" Highlighting, theming and appearance
" ==============================================================================
" ============================ File type highlights ============================
packadd cmakecache-syntax.vim
packadd vim-cmake-syntax
packadd vim-lsp-cxx-highlight
packadd i3-vim-syntax
packadd vim-toml
packadd vim-glsl

" ======================== Highlight Html Colour Codes =========================
packadd vim-coloresque

" Theme
let g:gruvbox_guisp_fallback = "bg"
let g:gruvbox_italic = '1'
packadd gruvbox
colorscheme industry
colorscheme gruvbox

" Underline letters for quick navigation
packadd quick-scope

" Highlight uses of the word under the cursor
packadd vim-illuminate

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

packadd vim-search-pulse

" Show file marks
packadd vim-signature

" ==============================================================================
" Completions
" ==============================================================================
packadd supertab " required to play nicely with coc
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
packadd ultisnips

source ~/.vim/pack/plugins/coc_bindings.vim
packadd coc.nvim
augroup CocDisableForCertainFiletypes
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave COMMIT_EDITMSG CocDisable
augroup END

packadd emmet-vim

" packadd syntastic
" packadd vim-hardtime

" ==============================================================================
" Integrations
" ==============================================================================
packadd editorconfig-vim

packadd vim-flog
" Show git log graph with format: [hash] {author name} (branch name) message
nnoremap <leader>gl :Flog -format=[%h]\ {%an}%d\ %s<CR>

packadd ack.vim
" use ag if available
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

packadd fcitx.vim

packadd fzf
nnoremap <leader>b :FZF<Enter>

packadd vim-fuzzysearch
nnoremap <leader>/ :FuzzySearch<Enter>

let g:gutentags_ctags_tagfile=".tags"
packadd vim-gutentags

packadd vim-fugitive
nnoremap <leader>gb :Gblame<Enter>

packadd vim-sourcetrail
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

" ==============================================================================
" Behaviours
" ==============================================================================
" Add word motions for CamelCase and underscore_case
map <silent> w  <Plug>CamelCaseMotion_w
map <silent> b  <Plug>CamelCaseMotion_b
map <silent> e  <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
packadd CamelCaseMotion

packadd  comfortable-motion.vim

packadd vim-markdown-folding

" ==============================================================================
" Vim Augmentations
" ==============================================================================
packadd DrawIt

packadd nerdtree
let NERDTreeMinimalUI=1
noremap <leader>nt :NERDTreeToggle<Enter>
noremap <leader>ntf :NERDTreeFind<Enter>

packadd undotree
noremap <leader>ut :UndotreeToggle<Enter>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
packadd vim-easy-align

packadd vim-commentary

packadd vim-gitgutter

packadd vim-startify

packadd vim-table-mode
nnoremap <leader>tr :TableModeRealign<Enter>

let g:extra_whitespace_ignored_filetypes = ['floggraph', 'git']
packadd vim-trailing-whitespace
noremap <leader>w :FixWhitespace<Enter>

let g:winresizer_start_key = '<leader>e'
packadd winresizer

let g:airline_powerline_fonts = 1
" do not show the mode, as this is shown already inside of the powerline
set noshowmode
packadd vim-airline

packadd vim-CtrlXA
