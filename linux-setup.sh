#!/bin/bash

# install stuff
sudo add-apt-repository ppa:jonathonf/vima -y
sudo apt update
sudo apt install vim tmux zsh -y

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
sed -i '/^plugins=/c\plugins=(git vi-mode z colored-man-pages)' ~/.zshrc
source ~/.zshrc

# Vim
# install vim-plug (TODO: check if already installed)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# .vimrc
cp .vimrc $HOME/.vimrc
cp -r .vim/snippet $HOME/.vim/
vim +PlugInstall +qall 

# Tmux
cp .tmux.conf $HOME/.tmux.conf
tmux source-file $HOME/.tmux.conf

