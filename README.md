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
