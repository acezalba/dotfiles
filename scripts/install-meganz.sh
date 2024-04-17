#!/usr/bin/env bash

# Command from https://mega.io/desktop#download
# For installing Mega.nz in Mint 21
# Requires rewrite for Mint 22 and above/ xUbuntu 23+

cd $HOME
wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb 
sudo apt install $HOME/megasync-xUbuntu_22.04_amd64.deb -y