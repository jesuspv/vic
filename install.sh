#!/bin/bash

# specific configuration

[[ $# -eq 1 ]] || { echo "error: missing configuration environment (X in ~/.vims/X)" >&2; exit 1; }
readonly CFG_ENV=$1
shift

# generic configuration

set -o errexit
set -o nounset
set -o pipefail

source "$(cd "${BASH_SOURCE[0]%/*}" && pwd)/packages.sh"

# logic

install-packages() {
   echo "Installing system packages..."

   sudo apt-get install --yes "${!PACKAGES[@]}"
}

install-plugins() {
   local -r mngr=~/.vims/$CFG_ENV/vim/autoload/plug.vim

   rm --force "$mngr"
   curl --create-dirs --fail --location --output "$mngr" \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

   ~/.vims/vi"$CFG_ENV" \
      +PlugUpgrade `# upgrade vim-plug` \
      +PlugUpdate `# install or update plugins` \
      +qall
}

install-repo() {
   mkdir --parents ~/.vims

   local -r repo=~/.vims/$CFG_ENV
   if [[ -d ~/.vims/$CFG_ENV ]]; then
      echo "Pulling repository changes..."
      cd "$repo"; git pull --rebase "$repo"; cd -
   else
      echo "Installing repository..."
      git clone "https://github.com/jesuspv/vi$CFG_ENV.git" "$repo"
   fi

   if [[ ! -x ~/.vims/vi$CFG_ENV ]]; then
      echo -e "#!/usr/bin/env bash\n~/.vims/$CFG_ENV/vi" "\"$CFG_ENV\"" '"$@"' > ~/.vims/vi"$CFG_ENV" 
      chmod a+x ~/.vims/vi"$CFG_ENV"
   fi
}

list-packages() {
   for pkg in "${!PACKAGES[@]}"; do
      echo "* [$pkg](${PACKAGES[$pkg]})"
   done
}

list-plugins() {
   local -r project=$(cd "${BASH_SOURCE[0]%/*}" && pwd)

   grep '^Plug' "$project/vim/plugin/settings/plug.vim" | sed "s|^Plug '\(.*\)'$|* [\1](https://github.com/\1)|"
}

show-tips() {
   printf '\n%s\n%s\n' \
      'To conclude installation, please consider to:' \
      " * Choose 'Fantasque Sans Mono Regular' (installed already) as your terminal font for readability."
   hash "vi$CFG_ENV" 2> /dev/null \
      || echo " * Make directory '~/.vims' available in your PATH to run command 'vi$CFG_ENV' for usability."
}

update-readme() {
   local -r project=$(cd "${BASH_SOURCE[0]%/*}" && pwd)

   local -r tmp=$(mktemp)
   trap "rm --force '$tmp'" EXIT

   (
      sed \
         --quiet \
         --expression='1,/__PACKAGE_LIST_BEGIN__/{p;}' \
         "$project/README.md";
      list-packages | sort;
      sed \
         --quiet \
         --expression='/__PACKAGE_LIST_END__/,/__PLUGIN_LIST_BEGIN__/{p;}' \
         "$project/README.md";
      list-plugins | sort;
      sed \
         --quiet \
         --expression='/PLUGIN_LIST_END/,$p' \
         "$project/README.md";
   ) > "$tmp"

   mv --force "$tmp" "$project/README.md"
}

main() {
   install-packages
   install-repo
   install-plugins
   update-readme # for development
   show-tips
}

main
