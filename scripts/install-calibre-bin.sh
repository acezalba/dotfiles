#!/usr/bin/env bash

# Command to install calibre
# https://calibre-ebook.com/download_linux

# default (opt)
# sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# personal/for hacking
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | \
    sudo sh /dev/stdin install_dir=/home/ghost/src/calibre-bin