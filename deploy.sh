#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# specific configuration

readonly DEPLOY_SOURCE=$(cd "${BASH_SOURCE[0]%/*}" && pwd)
export   DEPLOY_SOURCE

# git mock for install.sh
git() {
   [[ $# -eq 3 ]] || { echo "error: call '$*' not mocked" >&2; exit 1; }

   local -r deploy_target=$3

   case ${1:-} in
   clone|pull)
      rsync --archive --recursive --verbose "$DEPLOY_SOURCE/" "$deploy_target"
      ;;
   *)
      echo "error: call '$*' not mocked" >&2
      exit 1
      ;;
   esac
}
export -f git # mock it!

readonly CFG_ENV=$(head --lines=1 "$DEPLOY_SOURCE/README.md" | sed 's|# vi||')
"$DEPLOY_SOURCE/install.sh" "$CFG_ENV"
