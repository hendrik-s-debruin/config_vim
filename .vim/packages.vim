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
packadd i3-vim-syntax
packadd vim-toml
packadd vim-glsl
packadd vim-log-highlighting
packadd vim-markdown
packadd wgsl.vim

source ~/.vim/pack/plugins/settings_devicons.vim
packadd vim-devicons

" ======================== Highlight Html Colour Codes =========================
packadd vim-coloresque

" Underline letters for quick navigation
packadd quick-scope

" Highlight uses of the word under the cursor
packadd vim-illuminate

source ~/.vim/pack/plugins/settings_rainbow.vim
packadd vim-search-pulse

" Show file marks
packadd vim-signature

" Writing text
packadd goyo.vim

" ==============================================================================
" Completions
" ==============================================================================
packadd supertab " required to play nicely with coc

source ~/.vim/pack/plugins/settings_ultisnip.vim
packadd ultisnips

source ~/.vim/pack/plugins/settings_coc.vim
packadd coc.nvim

packadd emmet-vim

" ==============================================================================
" Integrations
" ==============================================================================
" packadd editorconfig-vim
source ~/.vim/pack/plugins/settings_ack.vim
packadd ack.vim

packadd fcitx.vim

source ~/.vim/pack/plugins/settings_fzf.vim
packadd fzf

source ~/.vim/pack/plugins/settings_fuzzysearch.vim
packadd vim-fuzzysearch

source ~/.vim/pack/plugins/settings_gutentags.vim
packadd vim-gutentags

source ~/.vim/pack/plugins/settings_fugitive.vim
packadd vim-fugitive

packadd vim-fubitive

packadd vim-rhubarb

source ~/.vim/pack/plugins/settings_flog.vim
packadd vim-flog

source ~/.vim/pack/plugins/settings_sourcetrail.vim
packadd vim-sourcetrail

source ~/.vim/pack/plugins/settings_rust.vim
packadd rust.vim

source ~/.vim/pack/plugins/settings_cmake4vim.vim
packadd cmake4vim

packadd vim-virtualenv
" ==============================================================================
" Behaviours
" ==============================================================================
source ~/.vim/pack/plugins/settings_camel_case_motion.vim
packadd CamelCaseMotion

packadd  comfortable-motion.vim

packadd vim-markdown-folding

" ==============================================================================
" Vim Augmentations
" ==============================================================================
packadd DrawIt

source ~/.vim/pack/plugins/settings_nerdtree.vim
packadd nerdtree

source ~/.vim/pack/plugins/settings_undotree.vim
packadd undotree

source ~/.vim/pack/plugins/settings_easy_align.vim
packadd vim-easy-align

packadd vim-commentary

packadd vim-gitgutter

packadd vim-startify

packadd calendar-vim

source ~/.vim/pack/plugins/settings_vimwiki.vim
packadd vimwiki

source ~/.vim/pack/plugins/settings_table_mode.vim
packadd vim-table-mode

source ~/.vim/pack/plugins/settings_trailing_white_space.vim
packadd vim-trailing-whitespace

source ~/.vim/pack/plugins/settings_winresizer.vim
packadd winresizer

source ~/.vim/pack/plugins/settings_powerline.vim

packadd vim-airline

packadd vim-CtrlXA

source ~/.vim/pack/plugins/settings_indentLine.vim
packadd indentLine

source ~/.vim/pack/plugins/settings_vimspector.vim
packadd vimspector

packadd wilder.nvim
call wilder#setup({'modes': [':', '/', '?']})

" ==============================================================================
" Theme
" ==============================================================================
packadd gruvbox
source ~/.vim/pack/plugins/settings_gruvbox.vim
colorscheme gruvbox

" =========================== Semantic Highlighting ============================
packadd vim-lsp-cxx-highlight
source ~/.vim/pack/plugins/settings_lsp_cxx_highlight.vim
