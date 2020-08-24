#!/bin/bash

if [ $HOME == "/root" ]; then
    echo "This script cannot be start as root..."
    exit
fi


echo "######################"
echo "### PACKAGING TOOL ###"
echo "######################"

packtool="0"
while [ $packtool != "1" ] && [ $packtool != "2" ]
do
    read -p 'WHATS YOUR PACKAGING TOOL:
[1] PACMAN
[2] APT-GET
YOUR CHOICE: ' packtool
done

if [ $packtool = "1" ]; then
    packtool="pacman"
    packArgInstall="-S"
    sudo pacman -Syu
else
    packtool="apt-get"
    packArgInstall="install"
    sudo apt-get upgrade
    sudo apt-get update
fi

echo "packtool: $packtool"
echo "packArgInstall: $packArgInstall"
echo "##############################"
echo "### INSTALLING NECESSARIES ###"
echo "##############################"

echo -e "y\n" | sudo $packtool $packArgInstallapm
echo -e "y\n" | sudo $packtool $packArgInstall atom
echo -e "y\n" | sudo $packtool $packArgInstall cmake
echo -e "y\n" | sudo $packtool $packArgInstall colorgrab
echo -e "y\n" | sudo $packtool $packArgInstall curl
echo -e "y\n" | sudo $packtool $packArgInstall evince
echo -e "y\n" | sudo $packtool $packArgInstall figlet
echo -e "y\n" | sudo $packtool $packArgInstall gcc
echo -e "y\n" | sudo $packtool $packArgInstall gdb
echo -e "y\n" | sudo $packtool $packArgInstall gdm
echo -e "y\n" | sudo $packtool $packArgInstall git
echo -e "y\n" | sudo $packtool $packArgInstall gparted
echo -e "y\n" | sudo $packtool $packArgInstall grub
echo -e "y\n" | sudo $packtool $packArgInstall grub-customizer
echo -e "y\n" | sudo $packtool $packArgInstall neovim
echo -e "y\n" | sudo $packtool $packArgInstall network-manager-applet
echo -e "y\n" | sudo $packtool $packArgInstall networkmanager
echo -e "y\n" | sudo $packtool $packArgInstall npm
echo -e "y\n" | sudo $packtool $packArgInstall postgresql
echo -e "y\n" | sudo $packtool $packArgInstall postman-bin
echo -e "y\n" | sudo $packtool $packArgInstall powerline-fonts
echo -e "y\n" | sudo $packtool $packArgInstall screenfetch
echo -e "y\n" | sudo $packtool $packArgInstall terminator
echo -e "y\n" | sudo $packtool $packArgInstall tlp
echo -e "y\n" | sudo $packtool $packArgInstall tmux
echo -e "y\n" | sudo $packtool $packArgInstall tree
echo -e "y\n" | sudo $packtool $packArgInstall ttf-font-awesome
echo -e "y\n" | sudo $packtool $packArgInstall ttf-material-design-icons
echo -e "y\n" | sudo $packtool $packArgInstall umlet
echo -e "y\n" | sudo $packtool $packArgInstall uncrustify
echo -e "y\n" | sudo $packtool $packArgInstall valgrind
echo -e "y\n" | sudo $packtool $packArgInstall vi
echo -e "y\n" | sudo $packtool $packArgInstall vim
echo -e "y\n" | sudo $packtool $packArgInstall w3m
echo -e "y\n" | sudo $packtool $packArgInstall wget
echo -e "y\n" | sudo $packtool $packArgInstall xclip
echo -e "y\n" | sudo $packtool $packArgInstall zsh
echo -e "y\n" | sudo $packtool $packArgInstall compton
echo -e "y\n" | sudo $packtool $packArgInstall conky
echo -e "y\n" | sudo $packtool $packArgInstall conky-manager
echo -e "y\n" | sudo $packtool $packArgInstall cronie
echo -e "y\n" | sudo $packtool $packArgInstall feh
echo -e "y\n" | sudo $packtool $packArgInstall font-awesome
echo -e "y\n" | sudo $packtool $packArgInstall lxappearance
echo -e "y\n" | sudo $packtool $packArgInstall polybar
echo -e "y\n" | sudo $packtool $packArgInstall ranger
echo -e "y\n" | sudo $packtool $packArgInstall rofi
echo -e "y\n" | sudo $packtool $packArgInstall siji

echo "##############################"
echo "### INSTALL POWERLINE FONT ###"
echo "##############################"

mkdir ~/.fonts
sudo cp files/Fura\ Code\ Regular\ Nerd\ Font\ Complete.ttf ~/.fonts/
fc-cache -f -v

echo "############"
echo "### DONE ###"
echo "############"


echo "##############"
echo "### CONFIG ###"
echo "##############"

cp files/{.conkyrc,.eslintrc,.prettierrc,.zshrc,.tmux.conf} $HOME/

cp -r files/config/nvim $HOME/.config/
ln -s ~/.vimrc $HOME/.config/nvim/init.vim
ln -s ~/.vim $HOME/.config/nvim

cp -r files/config/* ~/.config/

cp -r files/.oh-my-zsh ~/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cp -r files/.bin/ ~/
chsh -s $(which zsh)

echo "############"
echo "### DONE ###"
echo "############"
