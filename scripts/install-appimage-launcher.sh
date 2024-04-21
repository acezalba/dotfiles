#!/usr/bin/env bash

# Install appimage launcher
# 2024-04-22, 03:35:17 AM
# https://github.com/TheAssassin/AppImageLauncher/wiki/Install-on-Ubuntu-or-Debian

sudo apt install software-properties-common
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher