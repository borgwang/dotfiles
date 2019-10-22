#!/bin/bash

# install stuff
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

sudo apt update
sudo apt install tmux zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
sed -i '/^plugins=/c\plugins=(git vi-mode)' ~/.zshrc
source ~/.zshrc

# Vim
# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# .vimrc
cp .vimrc $HOME/.vimrc
cp -r .vim/snippet $HOME/.vim/
vim +PlugInstall +qall 

# Tmux
cp .tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf

