#!/usr/bin/env bash

# Install script for chrome from ppa
# 2024-04-26, 08:23:53 AM
# SRC: https://www.ubuntuupdates.org/ppa/google_chrome

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get install -y google-chrome-stable