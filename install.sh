#!/bin/bash

###########################################
#
# Install all necessaries for a new linux installation.
#
# Author : Antoine-Alexis Bourdon
# Origin : https://github.com/Maneal689/legendary-lamp
# Version : 1.0.0
# Dependency : None
#
###########################################

# who is ?
if [ $HOME == "/root" ]; then
    echo "This script cannot be start as root..."
    exit
fi

echo '#############'
echo '## Install ##'
echo '#############'

#add repo ?


#install package
xargs sudo apt-get install -y < files/pkglist

echo '##############'
echo '##  Config  ##'
echo '##############'

mkdir ~/.fonts
cp files/{.zshrc,.tmux.conf} $HOME/
cp -r files/config/* $HOME/.config/
cp -r files/{.bin,.oh-my-zsh,.fonts} $HOME/
fc-cache -f -v

ln -s $HOME/.config/nvim/init.vim ~/.vimrc
ln -s $HOME/.config/nvim ~/.vim

## new bash XD
chsh -s $(which zsh)

echo '############'
echo '##  DONE  ##'
echo '############'
