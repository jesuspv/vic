#!/bin/bash

# specific configuration

[[ $# -eq 1 ]] || { echo "error: missing configuration environment (X in ~/.vims/X)" >&2; exit 1; }
readonly CFG_ENV=$1
shift

# generic configuration

set -o errexit
set -o nounset
set -o pipefail

# logic

install-libs() {
   echo "Installing system libraries..."

   sudo apt-get install -y \
      ack-grep \
      curl \
      exuberant-ctags `# required?` \
      fonts-fantasque-sans \
      git \
      ranger \
      sshfs \
      tree \
      vim \
      && :
}

install-plugins() {
   local -r MNGR=~/.vims/$CFG_ENV/vim/autoload/plug.vim

   rm -f "$MNGR"
   curl -fLo "$MNGR" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

   ~/.vims/vi"$CFG_ENV" \
      +PlugUpgrade `# upgrade vim-plug` \
      +PlugUpdate `# install or update plugins` \
      +qall
}

install-repo() {
   mkdir -p ~/.vims

   if [[ -d ~/.vims/$CFG_ENV ]]; then
      echo "Pulling repository changes..."
      git pull --rebase ~/.vims/"$CFG_ENV"
   else
      echo "Installing repository..."
      git clone "https://github.com/jesuspv/vi$CFG_ENV.git" "~/.vims/$CFG_ENV"
   fi

   if [[ ! -x ~/.vims/vi$CFG_ENV ]]; then
      echo -e "#!/usr/bin/env bash\n~/.vims/$CFG_ENV/vi" "\"$CFG_ENV\"" '"$@"' > ~/.vims/vi"$CFG_ENV" 
      chmod a+x ~/.vims/vi"$CFG_ENV"
   fi
}

show-tips() {
   printf '\n%s\n%s\n' \
      'To conclude installation, please consider to:' \
      " * Choose 'Fantasque Sans Mono Regular' (installed already) as your terminal font for readability."
   hash "vi$CFG_ENV" 2> /dev/null \
      || echo " * Make directory '~/.vims' available in your PATH to run command 'vi$CFG_ENV' for usability."
}

main() {
   install-libs
   install-repo
   install-plugins
   show-tips
}

main
