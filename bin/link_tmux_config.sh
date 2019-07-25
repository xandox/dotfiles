#!/usr/bin/bash

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

SRC_CONFIG_FILE=$(realpath $BIN_DIR/../tmux/tmux.config)
TRG_CONFIG_FILE=$HOME/.tmux.conf

if [ -f $TRG_CONFIG_FILE ]
then
    if [ -L $TRG_CONFIG_FILE ]
    then
        TRG_DST=$(readlink $TRG_CONFIG_FILE)
        if [ "$TRG_DST" = "$SRC_CONFIG_FILE" ]
        then
            echo "$TRG_CONFIG_FILE already linked"
            exit 0
        fi
    fi
    echo "$TRG_CONFIG_FILE exists. remove it first"
else
    ln -s $SRC_CONFIG_FILE $TRG_CONFIG_FILE
fi
