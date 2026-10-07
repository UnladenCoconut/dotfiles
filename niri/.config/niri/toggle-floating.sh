#!/bin/sh
cd "$(dirname "$0")"
appid=$(niri msg focused-window | sed -n -r 's/^\s*App ID: "(.*)"$/\1/p')
[ -z "$appid" ] && exit 0
gawk -i inplace -f toggle-floating.awk -v appid="$appid" floating.kdl
