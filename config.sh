#!/bin/bash

cp -rf ./config/* $HOME/.config
sudo cp -arf ./bin/ $HOME/.local/bin/
cp -f ./profile $HOME/.profile
# cp -f ./xscreensaver $HOME/.xscreensaver
cp -f ./Xdefaults2 $HOME/.Xdefaults
ln -s $HOME/.Xdefaults $HOME/.Xresources
cp -f ./zprofile $HOME/.zprofile
cp -f ./xinitrc $HOME/.xinitrc
cp -r ./ssh $HOME/.ssh
cp ./Rprofile $HOME/.Rprofile
cp ./gitconfig $HOME/.gitconfig

mkdir $HOME/.tmp
rm $HOME/.bash_logout $HOME/.bash_profile

sudo rm /usr/share/gtk-2.0/gtkrc
sudo ln -s ~/.config/gtk-2.0/gtkrc-2.0 /usr/share/gtk-2.0/gtkrc
sudo usermod -a -G video $USER
sudo timedatectl set-ntp true
sudo sed -i 's/AutoEnable=false/AutoEnable=true/' /etc/bluetooth/main.conf

xdg-mime default org.pwmt.zathura-pdf-mupdf.desktop application/pdf
