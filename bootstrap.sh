#!/bin/bash

set -euo pipefail

sudo apt-get install -y git neovim
BINDIR=$HOME/.local/bin/ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply rockwotj
