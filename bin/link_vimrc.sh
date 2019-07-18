#/bin/bash

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

if [ ! -f $HOME/.vimrc ]; then
	echo "linking vimrc"
	BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
	ln -s $BIN_DIR/../vim/vimrc $HOME/.vimrc
else
	echo "$HOME/.vimrc exists"
fi

