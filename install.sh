#!/usr/bin/env bash

# generic configuration

standalone() { [[ ! -v BASH_SOURCE ]] || [[ $0 = $BASH_SOURCE ]]; }
sourced()    { ! standalone; }

if standalone; then
   set -o errexit
   set -o nounset
   set -o pipefail
fi

declare -A PACKAGES=(\
   [cmake]=https://cmake.org \
   [csope]=http://cscope.sourceforge.net/ \
   [curl]=https://curl.haxx.se/ \
   [exuberant-ctags]=http://ctags.sourceforge.net/ \
   [fonts-fantasque-sans]=https://github.com/belluzj/fantasque-sans \
   [git]=https://git-scm.com/ \
   [python-dev]=https://www.python.org/ \
   [python3-dev]=https://www.python.org/ \
   [ranger]=http://ranger.nongnu.org/ \
   [rdiff-backup]=http://www.nongnu.org/rdiff-backup/ \
   [sshfs]=https://github.com/libfuse/sshfs \
   [silversearcher-ag]=https://github.com/ggreer/the_silver_searcher \
   [tree]=https://linux.die.net/man/1/tree \
   [vim]=http://www.vim.org/ \
   )

# specific configuration

if standalone; then
   if [[ $# -eq 1 ]]; then
      echo "error: missing configuration environment (X in ~/.vims/X)" >&2
      exit 1
   fi
   readonly CFG_ENV=$1
   shift

   if [[ ${1:-} = system ]]; then
      readonly FLAG_SYSTEM=0 # any value actually, 0 is Bash's `true`
   fi
fi

# logic

install-packages() {
   [[ -v FLAG_SYSTEM ]] || return 0

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

sourced || main
