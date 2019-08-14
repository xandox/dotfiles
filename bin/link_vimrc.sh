#!/usr/bin/bash

# install plug.vim
if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
	echo "installing plug.vim"
	curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
	echo "plug.vim installed"
fi

mkdir -p $HOME/.vim/undodir
mkdir -p $HOME/.vim/swapdir
mkdir -p $HOME/.vim/backupdir

source "$(dirname $(readlink -f $0))/common.sh"
install_link "vim/vimrc" $HOME/.vimrc

