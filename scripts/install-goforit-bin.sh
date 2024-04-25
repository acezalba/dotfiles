#!/usr/bin/env bash

# Install latest git bins for goforit
# 2024-04-25, 03:07:44 PM
# SRC:
# https://code.launchpad.net/~go-for-it-team/+archive/ubuntu/go-for-it-daily
# https://github.com/JMoerman/Go-For-It

sudo add-apt-repository ppa:go-for-it-team/go-for-it-daily
sudo apt update
sudo apt install go-for-it