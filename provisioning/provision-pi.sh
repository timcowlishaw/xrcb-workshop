#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y vim xvfb sonic-pi-server build-essential
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
cargo install --git https://github.com/lpil/sonic-pi-tool/
pip install -r ../sensors/requirements.txt
sudo rpi-update
