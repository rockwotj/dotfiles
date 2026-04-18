#!/bin/bash

set -euo pipefail

sudo apt-get update -y
sudo apt-get install -y git curl software-properties-common

# Install neovim 12 (latest stable) from the official PPA
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update -y
sudo apt-get install -y neovim

BINDIR=$HOME/.local/bin/ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rockwotj
