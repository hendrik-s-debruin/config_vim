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

