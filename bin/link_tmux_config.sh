#!/usr/bin/bash

source "$(dirname $(readlink -f $0))/common.sh"
install_link "tmux/tmux.config" $HOME/.tmux.conf

