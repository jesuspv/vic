#!/usr/bin/env bash

source "$(cd "${BASH_SOURCE[0]%/*}" && pwd)/install.sh" # variable PACKAGES

list-packages() {
   for pkg in "${!PACKAGES[@]}"; do
      echo "* [$pkg](${PACKAGES[$pkg]})"
   done
}

list-plugins() {
   local -r project=$(cd "${BASH_SOURCE[0]%/*}" && pwd)

   grep '^Plug' "$project/vim/plugin/settings/plug.vim" | sed "s|^Plug '\([^']*\)'.*$|* [\1](https://github.com/\1)|"
}

main() {
   local -r project=$(cd "${BASH_SOURCE[0]%/*}" && pwd)

   local -r tmp=$(mktemp)
   trap "rm --force '$tmp'" EXIT

   (
      sed \
         --quiet \
         --expression='1,/__PACKAGE_LIST_BEGIN__/{p;}' \
         "$project/README.md";
      list-packages | sort --ignore-case;
      sed \
         --quiet \
         --expression='/__PACKAGE_LIST_END__/,/__PLUGIN_LIST_BEGIN__/{p;}' \
         "$project/README.md";
      list-plugins | sort --ignore-case;
      sed \
         --quiet \
         --expression='/PLUGIN_LIST_END/,$p' \
         "$project/README.md";
   ) > "$tmp"

   mv --force "$tmp" "$project/README.md"
}

main
