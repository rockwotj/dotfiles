#!/bin/bash

brew bundle install --global
chsh --shell $(which zsh)
rustup-init
