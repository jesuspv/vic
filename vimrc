" Plugin-specific settings {{{

for settings in split(glob(fnamemodify(resolve(expand("<sfile>:p")), ":h").'/vim/plugin/settings/*.vim'), '\n')
   exe 'source' settings
endfor

" }}}

" General custom settings {{{

try
   colorscheme gruvbox
catch /^Vim\%((\a\+)\)\=:E185/
   " do nothing
endtry

imap jj <Esc>

let mapleader = ","

set autoindent " turns it on
set background=dark
set cindent " stricter rules for C programs
set colorcolumn=+1 " textwidth+1
set foldmethod=syntax
set foldlevel=20 " large enough
set hlsearch
set number
set nowrapscan " incremental search stops at the end of file
set path+=** " find files recursively
set relativenumber
set shell=bash\ --login
set smartindent " does the right thing (mostly) in programs
set textwidth=80
set whichwrap+=<,>,h,l,[,] " wrap left and right

" tabs {{{

" See https://stackoverflow.com/a/1878983
set expandtab
set shiftwidth=3
set smarttab
set softtabstop=0
set tabstop=3

" }}}

" }}}

" General referenced settings {{{

" From http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" From https://www.linux.com/learn/vim-tips-folding-fun
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" From http://nvie.com/posts/how-i-boosted-my-vim/
nmap <silent> <leader>/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null

" }}}

" General custom settings for plugins {{{

nnoremap <leader>gt :YcmCompleter GoTo<CR>

" }}}
