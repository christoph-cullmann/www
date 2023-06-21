#!/usr/bin/env zsh

# failures are evil
set -e

# update our clone
git pull -q &> /dev/null

# export the GIT env vars we need to have links in the footer
export GIT_COMMIT_SHA=`git rev-parse --verify HEAD`
export GIT_COMMIT_SHA_SHORT=`git rev-parse --short HEAD`

# rerun hugo generator
hugo --minify --noTimes

# current date
date -Iseconds
