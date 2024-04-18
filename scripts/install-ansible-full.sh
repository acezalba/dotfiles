#!/usr/bin/env bash

# Install ansible full
# SRC: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# Assumes you have pipx already installed

pipx install --include-deps ansible -q
pipx inject --include-apps ansible argcomplete -q