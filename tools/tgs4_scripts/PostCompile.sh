#!/bin/bash

# REPO MAINTAINERS: KEEP CHANGES TO THIS IN SYNC WITH EventScripts/PostCompile.sh on TGS
set -e
set -x

# DB uses rust_g SQL (built in PreCompile). Do not build legacy BSQL / g++-6
# (g++-6-multilib is gone on Debian Bookworm+).

echo 'Deploying nsv13 compilation...'

cd "$1"

mkdir build

shopt -s extglob dotglob
mv !(build) build
shopt -u dotglob

chmod +x build/tools/deploy.sh
build/tools/deploy.sh "$1" "$1/build"

rm -rf build
