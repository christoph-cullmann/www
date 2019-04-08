#!/bin/bash

# failures are evil
set -e

# update our clone
git submodule update --init --recursive &> /dev/null
git submodule foreach git pull -q origin master &> /dev/null
git pull -q &> /dev/null

# rerun hugo generator
# export the GIT env vars we need to have links in the footer
export GIT_COMMIT_SHA=`git rev-parse --verify HEAD`
export GIT_COMMIT_SHA_SHORT=`git rev-parse --short HEAD`
./hugo

# current date
date -Iseconds
