set encoding=utf-8
set nocompatible
packadd! termdebug
packadd! matchit

source ~/.vim/appearance.vim
source ~/.vim/behaviour.vim
source ~/.vim/filetype.vim
source ~/.vim/functions.vim
source ~/.vim/bindings.vim
source ~/.vim/packages.vim

" This needs to be set after Gruvbox, which is set inside of packages.vim
" 232: grey3 #080808, 202: OrangeRed1 #ff5f00
highlight SpellBad ctermbg=232 ctermfg=202

" ==============================================================================
" Bookmarks
" ==============================================================================
" ==================================== CoC =====================================
" ~/.vim/coc-settings.json

" ================================== Snippets ==================================
" ~/.vim/UltiSnips/c.snippets
" ~/.vim/UltiSnips/cpp.snippets
" ~/.vim/UltiSnips/cpp_algorithm_mnemonics.snippets
" ~/.vim/UltiSnips/cpp_containers.snippets
" ~/.vim/UltiSnips/cpp_memory.snippets
" ~/.vim/UltiSnips/gitcommit.snippets
" ~/.vim/UltiSnips/snippets.snippets

" ============================ Syntax Highlighting =============================
" ~/.vim/after/syntax/c.vim
" ~/.vim/after/syntax/cpp.vim
" ~/.vim/conceal/operators.vim

" =========================== Settings for Filetypes ===========================
" ~/.vim/after/ftplugin/c.vim
" ~/.vim/after/ftplugin/fugitiveblame.vim
" ~/.vim/after/ftplugin/gitcommit.vim
" ~/.vim/after/ftplugin/markdown.vim
" ~/.vim/after/ftplugin/python.vim
" ~/.vim/after/ftplugin/tex.vim
