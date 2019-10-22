#!/bin/bash

# .inputrc
cp .inputrc $HOME/.inputrc
source $HOME/.inputrc

# Vim
# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# .vimrc
cp .vimrc $HOME/.vimrc
cp -r .vim/snippet $HOME/.vim/
vim +PlugInstall +qall 

# Tmux
cp .tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf

