#!/bin/bash

# ln -s $(pwd)/config/* $HOME/.config/
# ln -s $(pwd)/bin/* $HOME/.local/bin/

ln -s $(pwd)/dotfiles/profile $HOME/.profile
ln -s $(pwd)/dotfiles/Xdefaults2 $HOME/.Xdefaults
ln -s $HOME/.Xdefaults $HOME/.Xresources
ln -s $(pwd)/dotfiles/zprofile $HOME/.zprofile
ln -s $(pwd)/dotfiles/xinitrc $HOME/.xinitrc
ln -s $(pwd)/dotfiles/Rprofile $HOME/.Rprofile
ln -s $(pwd)/dotfiles/gitconfig $HOME/.gitconfig
sudo ln -s $(pwd)/etc/zsh/zshenv /etc/zsh/zshenv


# mkdir $HOME/.tmp
# rm $HOME/.bash_logout $HOME/.bash_profile

# sudo rm /usr/share/gtk-2.0/gtkrc
# sudo ln -s ~/.config/gtk-2.0/gtkrc-2.0 /usr/share/gtk-2.0/gtkrc
# sudo usermod -a -G video $USER
# sudo timedatectl set-ntp true
# sudo sed -i 's/AutoEnable=false/AutoEnable=true/' /etc/bluetooth/main.conf

# xdg-mime default org.pwmt.zathura-pdf-mupdf.desktop application/pdf
