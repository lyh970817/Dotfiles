#!/bin/bash

mkdir -p $HOME/.config
ln -s $(pwd)/config/* $HOME/.config/

mkdir -p $HOME/.local/bin
ln -s $(pwd)/bin/* $HOME/.local/bin/

ln -s $(pwd)/dotfiles/profile $HOME/.profile

ln -s $(pwd)/dotfiles/Xdefaults2 $HOME/.Xdefaults
ln -s $HOME/.Xdefaults $HOME/.Xresources

ln -s $(pwd)/dotfiles/zprofile $HOME/.zprofile
ln -s $(pwd)/dotfiles/xinitrc $HOME/.xinitrc
ln -s $(pwd)/dotfiles/Rprofile $HOME/.Rprofile
ln -s $(pwd)/dotfiles/gitconfig $HOME/.gitconfig
ln -s $(pwd)/dotfiles/curlrc $HOME/.curlrc

sudo ln -s $(pwd)/etc/zsh/zshenv /etc/zsh/zshenv
sudo ln -s $(pwd)/etc/pkgsync/pkg_install.list /etc/pkgsync/pkg_install.list

ln -s


sudo rm /usr/share/gtk-2.0/gtkrc
sudo ln -s ~/.config/gtk-2.0/gtkrc-2.0 /usr/share/gtk-2.0/gtkrc
sudo usermod -a -G video $USER
sudo timedatectl set-ntp true
sudo sed -i 's/AutoEnable=false/AutoEnable=true/' /etc/bluetooth/main.conf

xdg-mime default org.pwmt.zathura-pdf-mupdf.desktop application/pdf

sudo v2gen -u 'https://1.mxxst2.de/link/IXkdaCmjaXsAz6RG?sub=3&extend=1'
sudo systemctl enable --now v2ray
