#!/usr/bin/env bash

# Install latest chromium release from ppa
# SRC: https://launchpad.net/~savoury1/+archive/ubuntu/chromium
# 2024-04-26, 08:01:24 AM

sudo add-apt-repository ppa:savoury1/pipewire
sudo add-apt-repository ppa:savoury1/chromium
sudo apt-get update
sudo apt-get install chromium-browser -y