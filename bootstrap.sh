#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y git curl

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

cp ./bashrc ~/.bashrc
cp ./gitconfig ~/.gitconfig
tic -x ./xterm-ghostty.terminfo
