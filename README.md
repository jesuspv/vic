# vic

Vim configuration for C/C++ development projects.

All the configuration files (including plugins) are installed under `~/.vims/c`,
thus **not** changing any previous user configuration (under `~/.vim`).  In
order to run `vim` with such configuration, `~/.vims/vic` executable vim wrapper
is provided.  Please, add it to your `PATH` (or any other mechanism such as
aliases) to make it generally available in your environment.

## Installation

```bash
# with curl
curl --location https://raw.githubusercontent.com/jesuspv/vic/master/install.sh | bash -s c
# with wget
wget --output-document=- https://raw.githubusercontent.com/jesuspv/vic/master/install.sh | bash -s c
```

## Upgrade

Please, just run again the installation process to let the script proceed with
the configuration upgrade. Changes on `vimrc` file are merged by using `git
merge`.
