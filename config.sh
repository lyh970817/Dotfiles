#!/bin/bash

cp -rf ./config/* $HOME/.config
sudo cp -arf ./bin/ $HOME/.local/
cp -f ./profile $HOME/.profile
# cp -f ./xscreensaver $HOME/.xscreensaver
cp -f ./Xdefaults2 $HOME/.Xdefaults
ln -s $HOME/.Xdefaults $HOME/.Xresources
cp -f ./zprofile $HOME/.zprofile
cp -f ./xinitrc $HOME/.xinitrc
cp -r ./ssh $HOME/.ssh
cp -r ./Rprofile $HOME/.Rprofile

mkdir $HOME/.tmp
rm .bash_logout .bash_profile

sudo rm /usr/share/gtk-2.0/gtkrc
sudo ln -s ~/.config/gtk-2.0/gtkrc-2.0 /usr/share/gtk-2.0/gtkrc
sudo usermode -a -G video $USER
sudo timedatectl set-ntp true
sudo sed -i 's/AutoEnable=false/AutoEnable=true/' /etc/bluetooth/main.conf

xdg-mime default org.pwmt.zathura-pdf-mupdf.desktop application/pdf
