#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y git curl software-properties-common
# Install neovim 12 (latest stable) from the official PPA
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install -y neovim

cp ./bashrc ~/.bashrc
cp ./gitconfig ~/.gitconfig
tic -x ./xterm-ghostty.terminfo
