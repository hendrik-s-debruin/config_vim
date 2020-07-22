" ==============================================================================
" Highlight Catch2 Macros as Keywords
" ==============================================================================
syn keyword Keyword ANON_TEST_CASE
syn keyword Keyword Approx
syn keyword Keyword CAPTURE
syn keyword Keyword CHECK
syn keyword Keyword CHECKED_ELSE
syn keyword Keyword CHECKED_IF
syn keyword Keyword CHECK_FALSE
syn keyword Keyword CHECK_NOFAIL
syn keyword Keyword CHECK_NOTHROW
syn keyword Keyword CHECK_THAT
syn keyword Keyword CHECK_THROWS
syn keyword Keyword CHECK_THROWS_AS
syn keyword Keyword CHECK_THROWS_WITH
syn keyword Keyword SECTION
syn keyword Keyword DYNAMIC_SECTION
syn keyword Keyword FAIL
syn keyword Keyword FAIL_CHECK
syn keyword Keyword GIVEN
syn keyword Keyword INFO
syn keyword Keyword METHOD_AS_TEST_CASE
syn keyword Keyword REGISTER_TEST_CASE
syn keyword Keyword REQUIRE
syn keyword Keyword REQUIRE_FALSE
syn keyword Keyword REQUIRE_NOTHROW
syn keyword Keyword REQUIRE_THAT
syn keyword Keyword REQUIRE_THROWS
syn keyword Keyword REQUIRE_THROWS_WITH
syn keyword Keyword REQURIE_THROWS_AS
syn keyword Keyword REQUIRE_THROWS_MATCHES
syn keyword Keyword CHECK_THROWS_MATCHES
syn keyword Keyword STATIC_REQUIRE
syn keyword Keyword SUCCEED
syn keyword Keyword TEST_CASE
syn keyword Keyword THEN
syn keyword Keyword UNSCOPED_INFO
syn keyword Keyword WARN
syn keyword Keyword WHEN
syn keyword Keyword SCENARIO

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
