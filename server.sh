#!/usr/local/bin/zsh

# failures are evil
set -e

# export the GIT env vars we need to have links in the footer
export GIT_COMMIT_SHA=`git rev-parse --verify HEAD`
export GIT_COMMIT_SHA_SHORT=`git rev-parse --short HEAD`

# run hugo in local server mode, show all stuff
exec hugo server -D --buildFuture
