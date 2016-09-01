#!/bin/sh
set -e

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
BASEPATH=$(dirname "$SCRIPTPATH")
REPOPATH="$BASEPATH/repos"

if [ "$1" = "" ]; then
    ls -1 "$REPOPATH"
    exit 0
fi

ORGA_PATH=$(readlink -m "$REPOPATH/$1")
if [ ! -d "$ORGA_PATH" ]; then
    echo "No organisation $1" >&2
    exit 1
fi

find "$ORGA_PATH" -maxdepth 1 -type l -name "*.git" -exec basename -s .git {} \;
