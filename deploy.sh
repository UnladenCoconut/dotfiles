#!/bin/sh
FOLDERS="$(find . -maxdepth 1 -type d -name '*' | cut -d '/' -f 2-)"
stow $FOLDERS -t ~
sudo stow .root -t /
systemctl enable --now keyd
sudo keyd reload
