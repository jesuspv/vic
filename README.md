# vic

Vim configuration for C/C++ development projects.

All the configuration files (including plugins) are installed under
`~/.vims/c/`, thus **not** changing any previous user configuration (either
`~/.vimrc` or `~/.vim/`).  In order to run `vim` with such configuration,
executable vim wrapper `~/.vims/vic` is provided.  Please, add it to your
`PATH` (or by any other mechanism such as aliases) to make it generally
available in your environment.

## Installation

Installation requires `apt-get` command is available to install the
system-package dependencies (see list below). Run one of the next one-liners if
available:

```bash
# with curl
bash <(curl --location https://raw.githubusercontent.com/jesuspv/vic/master/install.sh) c +system
# with wget
bash <(wget --output-document=- https://raw.githubusercontent.com/jesuspv/vic/master/install.sh) c +system
```

Otherwise, install dependencies manually, running then the one-liner but without
the parameter `+system`.

Please, do not forget the ending argument `c`. It is the *configuration
environment*, that is, the `c` in `~/.vims/c/` and `~/.vims/vic`. It allows to
handle multiple vim configurations separately following the same pattern.

## Upgrade

Just run again the installation process to let the script proceed with
the configuration upgrade. Changes on `vimrc` file are merged by using `git
merge`.

## Uninstall

Run `rm -rf ~/.vims/c ~/.vims/vic`. Additionally, review the system package list
for packages not longer needed. If `apt-get` is available, remove them with
`apt-get remove --auto-remove`.

## List of System Packages

Please, notice that their installation requires `sudo` rights (password will be
requested).

[](__PACKAGE_LIST_BEGIN__)
* [cmake](https://cmake.org)
* [curl](https://curl.haxx.se/)
* [exuberant-ctags](http://ctags.sourceforge.net/)
* [fonts-fantasque-sans](https://github.com/belluzj/fantasque-sans)
* [git](https://git-scm.com/)
* [python3-dev](https://www.python.org/)
* [python-dev](https://www.python.org/)
* [ranger](http://ranger.nongnu.org/)
* [rdiff-backup](http://www.nongnu.org/rdiff-backup/)
* [silversearcher-ag](https://github.com/ggreer/the_silver_searcher)
* [sshfs](https://github.com/libfuse/sshfs)
* [tree](https://linux.die.net/man/1/tree)
* [vim](http://www.vim.org/)
[](__PACKAGE_LIST_END__)

This list is defined in `install.sh` (variable `PACKAGES`). Packages are
handled by [`apt-get`](https://linux.die.net/man/8/apt-get).

## List of Plugins

[](__PLUGIN_LIST_BEGIN__)
* [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [ap/vim-buftabline](https://github.com/ap/vim-buftabline)
* [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)
* [embear/vim-localvimrc](https://github.com/embear/vim-localvimrc)
* [francoiscabrol/ranger.vim](https://github.com/francoiscabrol/ranger.vim)
* [godlygeek/tabular](https://github.com/godlygeek/tabular)
* [gorkunov/smartgf.vim](https://github.com/gorkunov/smartgf.vim)
* [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)
* [junegunn/goyo.vim](https://github.com/junegunn/goyo.vim)
* [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align)
* [justinmk/vim-sneak](https://github.com/justinmk/vim-sneak)
* [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
* [kshenoy/vim-signature](https://github.com/kshenoy/vim-signature)
* [majutsushi/tagbar](https://github.com/majutsushi/tagbar)
* [mhinz/vim-startify](https://github.com/mhinz/vim-startify)
* [mileszs/ack.vim](https://github.com/mileszs/ack.vim)
* [morhetz/gruvbox](https://github.com/morhetz/gruvbox)
* [ntpeters/vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)
* [octol/vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
* [qpkorr/vim-bufkill](https://github.com/qpkorr/vim-bufkill)
* [Shougo/unite.vim](https://github.com/Shougo/unite.vim)
* [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)
* [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [Townk/vim-autoclose](https://github.com/Townk/vim-autoclose)
* [tpope/vim-dispatch](https://github.com/tpope/vim-dispatch)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [tpope/vim-projectionist](https://github.com/tpope/vim-projectionist)
* [tpope/vim-sensible](https://github.com/tpope/vim-sensible)
* [tpope/vim-vinegar](https://github.com/tpope/vim-vinegar)
* [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [Yggdroot/indentLine](https://github.com/Yggdroot/indentLine)
[](__PLUGIN_LIST_END__)

This list is defined in `vim/plugin/settings/plug.vim`. Plugins are handled by
[vim-plug](https://github.com/junegunn/vim-plug).
