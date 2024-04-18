#!/usr/bin/env bash

# installs latest neovim release
# SRC: https://github.com/neovim/neovim/blob/master/INSTALL.md

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo /usr/bin/rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim