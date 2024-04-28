#!/usr/bin/env zsh

# failures are evil
set -e

# update our clone
git pull -q &> /dev/null

# rerun hugo generator
hugo --minify --noTimes

# current date
date -Iseconds
