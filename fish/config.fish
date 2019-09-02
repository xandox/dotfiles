
set -gx PATH $PATH $HOME/local_root/bin
set -gx PATH $PATH $HOME/.cargo/bin
set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH $HOME/local_root/lib
set -gx LD_LIBRARY_PATH $LD_LIBRARY_PATH $HOME/local_root/lib64

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/xandox/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

set -gx ACM_ROOT $HOME/code/acm

set -gx OPTIX_INSTALL_DIR $HOME/local_root

set -gx SSH_MONSTER xandox@deathstar.artec-local

alias deathstar='ssh $SSH_MONSTER'

function mount-deathstar
    sshfs $SSH_MONSTER:/home/xandox/code $HOME/monster/code
    sshfs $SSH_MONSTER:/ds1 $HOME/monster/ds1
    sshfs $SSH_MONSTER:/ds2 $HOME/monster/ds2
end

function umount-deathstar
    sudo umount $HOME/monster/code
    sudo umount $HOME/monster/ds1
    sudo umount $HOME/monster/ds2
end
