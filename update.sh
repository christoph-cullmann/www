#!/bin/bash

# failures are evil
set -e

# update our clone
git pull -q &> /dev/null

# rerun hugo generator
# export the GIT env vars we need to have links in the footer
export GIT_COMMIT_SHA=`git rev-parse --verify HEAD`
export GIT_COMMIT_SHA_SHORT=`git rev-parse --short HEAD`
./hugo --minify

# copy .htaccess
cp -f static/.htaccess public

# current date
date -Iseconds
