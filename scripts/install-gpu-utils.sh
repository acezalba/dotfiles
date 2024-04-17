#!/usr/bin/env bash

# Command chain to install deb version of
# gpu-utils
# SRC: https://github.com/Ricks-Lab/gpu-utils/blob/master/docs/USER_GUIDE.md#official-debian-package-installation

# clean possible old install
sudo apt purge rickslab-gpu-utils
sudo apt purge ricks-amdgpu-utils
sudo apt autoremove
pip uninstall rickslab-gpu-utils

# add repository
wget -q -O - https://debian.rickslab.com/PUBLIC.KEY | sudo gpg --dearmour -o /usr/share/keyrings/rickslab-agent.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/rickslab-agent.gpg] https://debian.rickslab.com/gpu-utils/ eddore main' | sudo tee /etc/apt/sources.list.d/rickslab-gpu-utils.list

# update apt
sudo apt update

# install gpu-utils
sudo apt install rickslab-gpu-utils -y

