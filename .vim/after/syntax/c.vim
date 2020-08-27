" ==============================================================================
" treat `#cmakedefine` as `#define`
" ==============================================================================
hi def link cmakedefine Macro
syn region cmakedefine start="^\s*#cmakedefine" end="$"

" ==============================================================================
" Highlight Catch2 Macros as Keywords
" ==============================================================================
hi def link catch_keyword Keyword
syn keyword catch_keyword ANON_TEST_CASE
syn keyword catch_keyword Approx
syn keyword catch_keyword CAPTURE
syn keyword catch_keyword CHECK
syn keyword catch_keyword CHECKED_ELSE
syn keyword catch_keyword CHECKED_IF
syn keyword catch_keyword CHECK_FALSE
syn keyword catch_keyword CHECK_NOFAIL
syn keyword catch_keyword CHECK_NOTHROW
syn keyword catch_keyword CHECK_THAT
syn keyword catch_keyword CHECK_THROWS
syn keyword catch_keyword CHECK_THROWS_AS
syn keyword catch_keyword CHECK_THROWS_WITH
syn keyword catch_keyword SECTION
syn keyword catch_keyword DYNAMIC_SECTION
syn keyword catch_keyword FAIL
syn keyword catch_keyword FAIL_CHECK
syn keyword catch_keyword GIVEN
syn keyword catch_keyword INFO
syn keyword catch_keyword METHOD_AS_TEST_CASE
syn keyword catch_keyword REGISTER_TEST_CASE
syn keyword catch_keyword REQUIRE
syn keyword catch_keyword REQUIRE_FALSE
syn keyword catch_keyword REQUIRE_NOTHROW
syn keyword catch_keyword REQUIRE_THAT
syn keyword catch_keyword REQUIRE_THROWS
syn keyword catch_keyword REQUIRE_THROWS_WITH
syn keyword catch_keyword REQURIE_THROWS_AS
syn keyword catch_keyword REQUIRE_THROWS_MATCHES
syn keyword catch_keyword CHECK_THROWS_MATCHES
syn keyword catch_keyword STATIC_REQUIRE
syn keyword catch_keyword SUCCEED
syn keyword catch_keyword TEST_CASE
syn keyword catch_keyword THEN
syn keyword catch_keyword UNSCOPED_INFO
syn keyword catch_keyword WARN
syn keyword catch_keyword WHEN
syn keyword catch_keyword SCENARIO

" ==============================================================================
" Concealment
" ==============================================================================
source ~/.vim/conceal/operators.vim

syntax keyword Constant NULL     conceal cchar=∅
syntax keyword Constant short    conceal cchar=ℤ
syntax keyword Constant void     conceal cchar=⮾
syntax keyword Constant for      conceal cchar=∀
syntax keyword Constant float    conceal cchar=𝓡
syntax keyword Constant double   conceal cchar=𝓡
syntax keyword Constant goto     conceal cchar=⤇
syntax keyword Constant continue conceal cchar=⟰
syntax keyword Constant break    conceal cchar=⟱
syntax keyword Constant struct   conceal cchar=§
syntax keyword Constant int      conceal cchar=ℤ
syntax keyword Constant uint8_t  conceal cchar=ℤ
syntax keyword Constant uint16_t conceal cchar=ℤ
syntax keyword Constant uint32_t conceal cchar=ℤ
syntax keyword Constant uint64_t conceal cchar=ℤ
