#!/usr/bin/env zsh

# failures are evil
set -e

# update our clone
git pull -q &> /dev/null

# rerun hugo generator
hugo --cleanDestinationDir --enableGitInfo --gc --minify

# current date
date -Iseconds
