#!/usr/bin/env zsh

# failures are evil
set -e

# run hugo in local server mode, show all stuff
exec hugo server -D --buildFuture
