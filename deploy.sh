#!/bin/sh
set -e
FOLDERS="$(find . -maxdepth 1 -type d -not -name '.*' | cut -d '/' -f 2-)"
stow $FOLDERS -t $HOME
sudo stow .root -t /
sudo usermod -aG keyd $(whoami)
systemctl enable --now keyd
systemctl daemon-reload
