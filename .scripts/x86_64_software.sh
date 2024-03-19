#!/bin/bash

sudo apt update
sudo apt upgrade
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y \
	git \
	gh \
	tmux \
	neovim \
	zsh \
	nodejs \
	python3 \
	python3-dev \
	python3-pip \
	lsd \
	golang \
	git-absorb \
	cmake \
	make

curl -sS https://starship.rs/install.sh | sh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

go install golang.org/x/tools/gopls@latest
go install github.com/go-task/task/v3/cmd/task@latest

curl -Lo /tmp/llvm.sh https://apt.llvm.org/llvm.sh
chmod +x /tmp/llvm.sh
sudo /tmp/llvm.sh 18 all

# https://cloud.google.com/sdk/docs/install#deb
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update && sudo apt-get install google-cloud-cli

curl -Lo /tmp/git-delta.deb https://github.com/dandavison/delta/releases/download/0.17.0/git-delta_0.17.0_amd64.deb
sudo dpkg -i /tmp/git-delta.deb

curl -Lo /tmp/vivid.deb "https://github.com/sharkdp/vivid/releases/download/v0.9.0/vivid_0.9.0_amd64.deb"
sudo dpkg -i /tmp/vivid.deb
