#!/usr/bin/env bash

# Install inkscape from dev ppa
# 2024-04-26, 07:09:34 AM
# SRC: https://inkscape.org/release/inkscape-1.2/gnulinux/ubuntu/ppa/dl/

sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt update
sudo apt install inkscape -y