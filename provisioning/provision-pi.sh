#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y vim xvfb sonic-pi build-essential
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
cargo install --git https://github.com/lpil/sonic-pi-tool/
pip3 install -r ../sensors/requirements.txt
mkdir -p ~/.config/autostart
cp /usr/share/applications/sonic-pi.desktop ~/.config/autostart
sudo rpi-update
