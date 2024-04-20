#!/usr/bin/env bash

# downloads, compiles, and symlinks calibre repo
# for local use.

# SRC:
# https://manual.calibre-ebook.com/develop.html
# 

repo="https://github.com/acezalba/calibre.git"
dir="/home/ghost/src/"

# shellcheck "$DOTFILES"/scripts/install-calibre.sh

# if [ $? -ne 0 ]; then
#     echo "ShellCheck failed! Please fix the errors."
#     exit 1
# fi

clone_repo(){
    git clone $repo $dir/calibre
}


clone_repo