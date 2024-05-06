#!/usr/bin/env bash

# Script to install YQ'
# a cli tool to convert
# json to yaml and vice versa

# https://github.com/mikefarah/yq/#install

# Usage
# Convert yaml to json: cat <YAML-FILE-NAME> | yq e -o json
# Convert json to yaml: yq -Poy sample.json

# 2024-05-06, 11:49:51 AM
# Context: Use to convert and draft theme.json files for themeing in WP-FSE

sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq
sudo chmod +x /usr/bin/yq