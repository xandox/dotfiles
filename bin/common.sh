

function install_link() {
    local dotfile_source="$1"
    local target_link="$2"

    local bin_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    local src_file=$(realpath "$bin_dir/../$dotfile_source")
    local dst_file=$target_link

    if [ -f $dst_file ]
    then
        if [ -L $dst_file ]
        then
            local dst_trg_file=$(readlink "$dst_file")
            if [ "$dst_trg_file" = "$src_file" ]
            then
                echo "$src_file -> $dst_file already linked."
                return 0
            fi
        fi
        echo "$dst_file exsists. remove it first"
    else
        ln -s "$src_file" "$dst_file"
        echo "$src_file -> $dst_file linked."
    fi
}
