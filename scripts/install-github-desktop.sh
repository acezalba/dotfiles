#!/usr/bin/env bash

# Install script for the linux fork
# of Github Desktop
# 2024-04-26, 09:43:17 AM
# SRC: https://github.com/shiftkey/desktop?tab=readme-ov-file#installation-via-package-manager

wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
sudo apt update && sudo apt install github-desktop -y