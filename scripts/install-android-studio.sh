#!/usr/bin/env bash

# 2024-04-22, 04:01:32 AM
# Add repo for android studio builds
# https://launchpad.net/~maarten-fonville/+archive/ubuntu/android-studio

sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt update
sudo apt install android-studio -y