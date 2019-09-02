
function dotfile_dir() {
    local bin_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    local dotfile_dir_name="$(realpath "$bin_dir/../")"
    echo "$dotfile_dir_name"
}

function do_symlink() {
    local src="$1"
    local dst="$2"
    local dstdir=$(dirname $dst)
    if [ ! -d "$dstdir" ]
    then
        mkdir -p "$dstdir"
    fi
    ln -s "$src" "$dst"
}

function install_link() {
    local dotfile_source="$1"
    local target_link="$2"
    local base_dir=$(dotfile_dir)
    local src_file=$(realpath "$base_dir/$dotfile_source")
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
        do_symlink "$src_file" "$dst_file"
        echo "$src_file -> $dst_file linked."
    fi
}

