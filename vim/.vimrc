
set number
"set nonumber

" Status line
"set statusline=2

" vim color
syntax on
"https://github.com/w0ng/vim-hybrid
"set background=dark
"colorscheme hybrid
"https://github.com/tomasr/molokai
colorscheme molokai
set t_Co=256

" vimmdiff color configuration
"http://qiita.com/takaakikasai/items/b46a0b8c94e476e57e31
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

"http://karaage.hatenadiary.jp/entry/2016/01/01/073000
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
	if &compatible
		set nocompatible	" Be iMproved
	endif

	" Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" word unit diff
NeoBundle 'vim-scripts/diffchar.vim'
" status line strengthen
NeoBundle 'itchyny/lightline.vim'
" indent color display
NeoBundle 'nathanaelkane/vim-indent-guides'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" vimdiff auto diffchar.vim
"http://qiita.com/takaakikasai/items/0d617b6e0aed490dff35
"http://takaaki-kasai-tech.blogspot.jp/2014/10/vimdiff-word-diff-by-diffchar.html
if &diff
	augroup enable_diffchar
		autocmd!
		autocmd VimEnter * execute "%SDChar"
	augroup END
endif
let g:DiffUnit = "Word3"
let g:DiffUpdate = 1

" lightline display
"http://itchyny.hatenablog.com/entry/20130828/1377653592
set laststatus=2
"	\ 'colorscheme': 'wombat',
let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ }

" indent display
"http://qiita.com/marrontan619/items/541a1374e1ac672977e6
set tabstop=4
set expandtab
set shiftwidth=4
"http://www.mk-mode.com/octopress/2014/02/10/vim-installation-of-indent-plugin/
" vim-indent-guides auto start
let g:indent_guides_enable_on_vim_startup=1
" start guide indent level
let g:indent_guides_start_level=2
" no auto color
"let g:indent_guides_auto_colors=0
" Odd color
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" Even color
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
" guide width
let g:indent_guides_guide_size = 1

" Jq
" brew search jq | brew install jq
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
    if 0 == a:0
        let l:arg = "."
    else
        let l:arg = a:1
    endif
    execute "%! jq \"" . l:arg . "\""
endfunction
