" Plugin-specific settings {{{

for settings in split(glob(fnamemodify(resolve(expand("<sfile>:p")), ":h").'/vim/plugin/settings/*.vim'), '\n')
   exe 'source' settings
endfor

" }}}

" General personal settings {{{

try
   colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
   " do nothing
endtry

imap jj <Esc>

let mapleader = ","

" save your muscles by just typing '.' instead of ':' (for commands)
nore . :

set background=dark
set hlsearch
set number
set foldmethod=syntax
set foldlevel=20 " large enough

" }}}

" General reference settings {{{

" From http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" From https://www.linux.com/learn/vim-tips-folding-fun
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" }}}
