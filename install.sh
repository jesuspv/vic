#!/usr/bin/env bash

# specific configuration

if [[ $0 = $BASH_SOURCE ]]; then # not sourced
   [[ $# -eq 1 ]] || { echo "error: missing configuration environment (X in ~/.vims/X)" >&2; exit 1; }
   readonly CFG_ENV=$1
   shift
fi

# generic configuration

if [[ $0 = $BASH_SOURCE ]]; then # not sourced
   set -o errexit
   set -o nounset
   set -o pipefail
fi

# TODO(jesuspv) exuberant-ctags could be not required
declare -A PACKAGES=(\
   [ack-grep]=https://beyondgrep.com/ \
   [curl]=https://curl.haxx.se/ \
   [exuberant-ctags]=http://ctags.sourceforge.net/ \
   [fonts-fantasque-sans]=https://github.com/belluzj/fantasque-sans \
   [git]=https://git-scm.com/ \
   [ranger]=http://ranger.nongnu.org/ \
   [sshfs]=https://github.com/libfuse/sshfs \
   [tree]=https://linux.die.net/man/1/tree \
   [vim]=http://www.vim.org/ \
   )

# logic

install-packages() {
   echo "Installing system packages..."

   sudo apt-get install --yes "${!PACKAGES[@]}"
   sudo apt-get autoremove
}

install-plugins() {
   local -r mngr=~/.vims/$CFG_ENV/vim/autoload/plug.vim

   rm --force "$mngr"
   curl --create-dirs --fail --location --output "$mngr" \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

   ~/.vims/vi"$CFG_ENV" \
      +PlugUpgrade `# upgrade vim-plug` \
      +PlugUpdate `# install or update plugins` \
      +PlugClean! `# remove unused directories` \
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

show-tips() {
   printf '\n%s\n%s\n' \
      'To conclude installation, please consider to:' \
      " * Choose 'Fantasque Sans Mono Regular' (installed already) as your terminal font for readability."
   hash "vi$CFG_ENV" 2> /dev/null \
      || echo " * Make directory '~/.vims' available in your PATH to run command 'vi$CFG_ENV' for usability."
}

main() {
   install-packages
   install-repo
   install-plugins
   show-tips
}

[[ $0 != $BASH_SOURCE ]] || main # sourced or run
