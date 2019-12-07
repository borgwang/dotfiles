#!/bin/bash

# .inputrc
echo "sync inputrc..."
cp .inputrc $HOME/.inputrc
source $HOME/.inputrc

# Vim
# install vim-plug
if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "vim-plug installed"
else
    echo "vim-plug not installed"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# .vimrc
echo "sync vimrc..."
cp .vimrc $HOME/.vimrc
cp -r .vim/snippet $HOME/.vim/
vim +PlugInstall +qall 

# Tmux
echo "sync tmux config..."
cp .tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf

# zshrc
echo "alias cda=\"conda activate\"" >> ~/.zshrc
echo "alias cdd=\"conda deactivate\"" >> ~/.zshrc

echo "done"

