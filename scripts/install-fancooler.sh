#!/usr/bin/env bash

# Instructions to install fan controller
# https://gitlab.com/coolercontrol/coolercontrol#debian

sudo apt install curl apt-transport-https
curl -1sLf \
  'https://dl.cloudsmith.io/public/coolercontrol/coolercontrol/setup.deb.sh' \
  | sudo -E bash
sudo apt update
sudo apt install coolercontrol
sudo systemctl enable --now coolercontrold
sudo systemctl stop coolercontrold
/usr/bin/python3 -m pip install liquidctl --upgrade
sudo systemctl start coolercontrold