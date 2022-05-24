set conceallevel=2

" Hide link markup
autocmd Filetype markdown,liquid,text
	\ syn region markdownLink matchgroup=markdownLinkDelimiter
	\ start="(" end=")" keepend contained conceal contains=markdownUrl

syn region markdownLinkText matchgroup=markdownLinkTextDelimiter
	\ start="!\=\[\%(\_[^]]*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@="
	\ nextgroup=markdownLink,markdownId skipwhite
	\ contains=@markdownInline,markdownLineStart
	\ concealends

set fo+=t
