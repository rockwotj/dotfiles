#!/bin/bash

sudo apt install git build-essential
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/null
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
BINDIR=$HOME/.local/bin/ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rockwotj
echo '/home/linuxbrew/.linuxbrew/bin/zsh' | sudo tee /etc/shells
(cd ~/.local && python3 -m venv venv && ./venv/bin/pip install pynvim)
npm install -g neovim basedpyright
tic -x ./xterm-ghostty.terminfo
