#!/bin/bash -eu

#-- from https://stackoverflow.com/a/18948381/531179
#-- see `man 1 git` /EXTERNAL_DIFF, or https://www.git-scm.com/docs/git

#-- uncomment for debug:
#echo >&2 "$(basename $0) args: $@"; set -x

FILENAME="$1"
OLDFILE="$2"
OLDHASH="$3"
OLDMODE="$4"
NEWFILE="$5"
NEWHASH="$6"
NEWMODE="$7"

git diff --no-ext-diff --word-diff --color "$OLDFILE" "$NEWFILE" || exit 0

