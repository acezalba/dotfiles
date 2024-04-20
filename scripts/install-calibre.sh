#!/usr/bin/env bash

# downloads, compiles, and symlinks calibre repo
# for local use.

# SRC:
# https://manual.calibre-ebook.com/develop.html
# https://github.com/kovidgoyal/calibre/blob/master/bypy/README.rst
# 

repo="https://github.com/acezalba/calibre.git"
dir="/home/ghost/src/"

# shellcheck "$DOTFILES"/scripts/install-calibre.sh

# if [ $? -ne 0 ]; then
#     echo "ShellCheck failed! Please fix the errors."
#     exit 1
# fi

# Calibre requires a compiled version of podofo. v0.10. refer to repo.
# todo: compile and expose podofo to linux lib path.
install_dependencies(){
    sudo apt install -y libuchardet-dev libhunspell-dev libpodofo-dev libstemmer-dev libpodofo-utils libpodofo0.9.7    
}

clone_repo(){
    git clone $repo $dir/calibre
}

setup_calibre(){
    python3 setup.py bootstrap
    python3 setup.py build_dep linux
    python3 setup.py build_dep linux-arm64
    python3 setup.py develop
}

install_dependencies
clone_repo