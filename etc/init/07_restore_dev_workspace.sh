#!/bin/sh

. ${HOME}/.dotfiles/etc/init/constants.sh

# get file name latest develop workspace archive
latest=$(find "${GOOGLE_DRIVE_DIR}/my/develop/backup/workspace" -type f -name "*.tar.bz2" -print0 \
  | xargs -0 stat -f "%m %N" \
  | sort -nr \
  | head -1 \
  | cut -d' ' -f2-)

# make develop workspace
mkdir -p "${HOME}/dev"

# restore develop workspace
if [ -n "$latest" ]; then
  (cd "${HOME}/dev" || exit; tar xjf "${latest}";)
else
  echo "Warning: Could not find a backup of the develop workspace. Skipping restore." >&2
fi
