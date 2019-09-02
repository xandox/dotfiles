#!/usr/bin/bash

source "$(dirname $(readlink -f $0))/common.sh"

for filename in $(find $(dotfile_dir)/fish -type f)
do
    src_file=$(realpath "$filename" --relative-to "$(dotfile_dir)")
    dst_file=$HOME/.config/$src_file
    echo "install link: $src_file -> $dst_file"
    install_link $src_file $dst_file
done


