" This file loads plugins. It is also responsible for setting any plugin-related
" bindings or settings

" Plugins are loaded manually. This way, they may be selectively enabled or
" disabled in future

" ==============================================================================
" Git Log
" ==============================================================================
packadd vim-flog
" Show git log graph with format: [hash] {author name} (branch name) message
nnoremap <leader>gl :Flog -format=[%h]\ {%an}%d\ %s<CR>

" ==============================================================================
" EditorConfig
" ==============================================================================
packadd editorconfig-vim

" ==============================================================================
" i3wm Syntax Highlighting
" ==============================================================================
packadd i3-vim-syntax

" ==============================================================================
" C++ Highlighting
" ==============================================================================
packadd vim-lsp-cxx-highlight

" ==============================================================================
" Preconfigured Completions
" ==============================================================================
packadd supertab " required to play nicely with coc
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
packadd ultisnips

" ==============================================================================
" Syntax highlighting for toml files
" ==============================================================================
packadd vim-toml

" ==============================================================================
" Add word motions for CamelCase and underscore_case
" ==============================================================================
map <silent> w  <Plug>CamelCaseMotion_w
map <silent> b  <Plug>CamelCaseMotion_b
map <silent> e  <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
packadd CamelCaseMotion

" ==============================================================================
" search for occurances of text
" ==============================================================================
packadd ack.vim
" use ag if available
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" ==============================================================================
" smooth scrolling
" ==============================================================================
packadd  comfortable-motion.vim

" ==============================================================================
" ascii drawing
" ==============================================================================
packadd DrawIt

" ==============================================================================
" html writing
" ==============================================================================
packadd emmet-vim

" ==============================================================================
" multi-language keyboard
" ==============================================================================
packadd fcitx.vim

" ==============================================================================
" fuzzy file finder
" ==============================================================================
packadd fzf
nnoremap <leader>b :FZF<Enter>

" ==============================================================================
" theme
" ==============================================================================
let g:gruvbox_guisp_fallback = "bg"
let g:gruvbox_italic = '1'
packadd gruvbox
colorscheme industry
colorscheme gruvbox

" ==============================================================================
" File manager
" ==============================================================================
packadd nerdtree
let NERDTreeMinimalUI=1
noremap <leader>nt :NERDTreeToggle<Enter>
noremap <leader>ntf :NERDTreeFind<Enter>

" ==============================================================================
" underline letters for quick navigation
" ==============================================================================
packadd quick-scope

" ==============================================================================
" syntax checking
" ==============================================================================
" recommended settings of syntastic TODO read the docs and see if this can be
" improved
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" packadd syntastic

" ==============================================================================
" Visualising the undo history
" ==============================================================================
packadd undotree
noremap <leader>ut :UndotreeToggle<Enter>

" ==============================================================================
" CMake highlighting
" ==============================================================================
packadd vim-cmake-syntax

" ==============================================================================
" Highlight html colour codes with their actual colours
" ==============================================================================
packadd vim-coloresque

" ==============================================================================
" Easily comment things
" ==============================================================================
packadd vim-commentary

" ==============================================================================
" Align text intelligently
" ==============================================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
packadd vim-easy-align

" ==============================================================================
" Fuzzy search in buffer
" ==============================================================================
packadd vim-fuzzysearch
nnoremap <leader>/ :FuzzySearch<Enter>

" ==============================================================================
" Show modified lines since last commit
" ==============================================================================
packadd vim-gitgutter

" ==============================================================================
" highlighting for glsl
" ==============================================================================
packadd vim-glsl

" ==============================================================================
" automatically generate tag file
" ==============================================================================
let g:gutentags_ctags_tagfile=".tags"
packadd vim-gutentags

" ==============================================================================
" highlight usages of the word under the cursor
" ==============================================================================
packadd vim-illuminate

" ==============================================================================
" add proper folding for markdown
" ==============================================================================
packadd vim-markdown-folding

" ==============================================================================
" visually pulse line when jumping to search
" ==============================================================================
packadd vim-search-pulse

" ==============================================================================
" show file marks
" ==============================================================================
packadd vim-signature

" ==============================================================================
" fancy start screen
" ==============================================================================
packadd vim-startify

" ==============================================================================
" create tables in ascii
" ==============================================================================
packadd vim-table-mode
nnoremap <leader>tr :TableModeRealign<Enter>

" ==============================================================================
" highlight and remove trailing whitespace characters
" ==============================================================================
let g:extra_whitespace_ignored_filetypes = ['floggraph', 'git']
packadd vim-trailing-whitespace
noremap <leader>w :FixWhitespace<Enter>

" ==============================================================================
" better window management
" ==============================================================================
let g:winresizer_start_key = '<leader>e'
packadd winresizer

" ==============================================================================
" nice status bar
" ==============================================================================
let g:airline_powerline_fonts = 1
" do not show the mode, as this is shown already inside of the powerline
set noshowmode
packadd vim-airline

" ==============================================================================
" Code completion
" ==============================================================================
source ~/.vim/pack/plugins/coc_bindings.vim
packadd coc.nvim
augroup CocDisableForCertainFiletypes
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave COMMIT_EDITMSG CocDisable
augroup END

" ==============================================================================
" Git Integration
" ==============================================================================
packadd vim-fugitive
nnoremap <leader>gb :Gblame<Enter>

" ==============================================================================
" Hard Mode
" ==============================================================================
let g:hardtime_default_on          = 1
let g:hardtime_showmsg             = 1
let g:hardtime_ignore_quickfix     = 1
let g:hardtime_allow_different_key = 1
" packadd vim-hardtime
nnoremap <leader>hm :HardTimeToggle<Enter>

" ==============================================================================
" colour level for nested brackets
" ==============================================================================
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

" ==============================================================================
" Source Exploring
" ==============================================================================
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
