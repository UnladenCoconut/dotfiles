#!/bin/sh
set -e
FOLDERS="$(find . -maxdepth 1 -type d -not -name '.*' | cut -d '/' -f 2-)"
stow $FOLDERS -t $HOME
sudo stow .root -t /
systemctl enable --now keyd
sudo keyd reload
sudo usermod -aG keyd $(whoami)
