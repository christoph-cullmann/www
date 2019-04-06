#!/bin/bash

# failures are evil
set -e

# update our clone
git submodule update --init --recursive
git submodule update --recursive --remote
git pull

# rerun hugo generator
./hugo

# current date
date -Iminutes
