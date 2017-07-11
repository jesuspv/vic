# vic

Vim configuration for C/C++ development projects.

All the configuration files (including plugins) are installed under
`~/.vims/c/`, thus **not** changing any previous user configuration (either
`~/.vimrc` or `~/.vim/`).  In order to run `vim` with such configuration,
executable vim wrapper `~/.vims/vic` is provided.  Please, add it to your
`PATH` (or by any other mechanism such as aliases) to make it generally
available in your environment.

## Installation

Use one of these one-liners:

```bash
# with curl
bash <(curl --location https://raw.githubusercontent.com/jesuspv/vic/master/install.sh) c
# with wget
bash <(wget --output-document=- https://raw.githubusercontent.com/jesuspv/vic/master/install.sh) c
```

Please, do not forget the ending argument `c`. It is the *configuration
environment*, that is, the `c` in `~/.vims/c/` and `~/.vims/vic`. It allows to
handle multiple vim configurations separately following the same pattern.

## Upgrade

Just run again the installation process to let the script proceed with
the configuration upgrade. Changes on `vimrc` file are merged by using `git
merge`.

## List of System Packages

This is the list of packages installed:

[](__PACKAGE_LIST_BEGIN__)
* [ack-grep](https://beyondgrep.com/)
* [git](https://git-scm.com/)
* [vim](http://www.vim.org/)
* [ranger](http://ranger.nongnu.org/)
* [exuberant-ctags](http://ctags.sourceforge.net/)
* [curl](https://curl.haxx.se/)
* [sshfs](https://github.com/libfuse/sshfs)
* [fonts-fantasque-sans](https://github.com/belluzj/fantasque-sans)
* [tree](https://linux.die.net/man/1/tree)
[](__PACKAGE_LIST_END__)

Please, notice that this step requires sudo rights (password will be requested).

## List of Plugins

[](__PLUGIN_LIST_BEGIN__)
* [Townk/vim-autoclose](https://github.com/Townk/vim-autoclose)
* [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)
* [francoiscabrol/ranger.vim](https://github.com/francoiscabrol/ranger.vim)
* [godlygeek/tabular](https://github.com/godlygeek/tabular)
* [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align)
* [justinmk/vim-sneak](https://github.com/justinmk/vim-sneak)
* [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
* [kshenoy/vim-signature](https://github.com/kshenoy/vim-signature)
* [majutsushi/tagbar](https://github.com/majutsushi/tagbar)
* [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
* [mileszs/ack.vim](https://github.com/mileszs/ack.vim)
* [morhetz/gruvbox](https://github.com/morhetz/gruvbox)
* [nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
* [octol/vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
* [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [tpope/vim-dispatch](https://github.com/tpope/vim-dispatch)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [tpope/vim-projectionist](https://github.com/tpope/vim-projectionist)
* [tpope/vim-sensible](https://github.com/tpope/vim-sensible)
* [tpope/vim-vinegar](https://github.com/tpope/vim-vinegar)
* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
[](__PLUGIN_LIST_END__)
