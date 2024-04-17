#!/usr/bin/env bash

# Manual install of nvm
# Personal version
# SRC: https://github.com/pyenv/pyenv/wiki#suggested-build-environment

# install nvm to src folder
export NVM_DIR="$HOME/src/.nvm" && (
  git clone https://github.com/acezalba/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"