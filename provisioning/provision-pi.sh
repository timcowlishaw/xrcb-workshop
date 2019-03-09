#!/bin/bash
sudo apt-get install -y vim xvfb sonic-pi-server build-essential
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
cargo install --git https://github.com/lpil/sonic-pi-tool/
