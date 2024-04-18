#!/usr/bin/env bash

# installs ubuntu-native packages
# that comes with my usual application installs
# or that which does not rely on
# version managed exec setups (i.e. nvm, pyenv)

packages=("git" 
          "exa"
          "build-essential"
          "cmake"
          "g++"
          "asciidoctor"
          "shellcheck"
          "clinfo"
          "gpu-ls"
          "font-manager"
          "font-viewer")

for package in "${packages[@]}"; do
    sudo apt install -y $package 
done
