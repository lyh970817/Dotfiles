sh ./pamac.sh

sudo pacman -S i3-gaps
sudo pacman -S i3-wm
sudo pacman -S i3-blocks
sudo pacman -S i3-lock

# Wallpaper
sudo pacman -S --noconfirm feh
sudo pacman -S --noconfirm curl

sudo pacman -S --noconfirm xorg
sudo pacman -S --noconfirm xorg-xinit
sudo pacman -S --noconfirm x-server

# Font
sudo pacman -S --noconfirm ttf-fira-code
sudo pacman -S --noconfirm powerline-fonts
sudo pacman -S --noconfirm wqy-zenhei

# light control
sudo pacman -S --noconfirm light

# search
sudo pacman -S --noconfirm fzf

# ssh
sudo pacman -S --noconfirm openssh

# Bluetooth keyboard
yaourt -S --noconfirm obinskit

# GTK setting
sudo pacman -S --noconfirm lxappearance
sudo pacman -S --noconfirm gnome-themes-extra
yaourt -S --noconfirm gtk-theme-numix-solarized

# R
sudo pacman -S --noconfirm r

# Editor
sudo pacman -S --noconfirm neovim
sudo pacman -S --noconfirm python-pynvim

# Screenshot
sudo pacman -S --noconfirm scrot

# Notification
sudo pacman -S --noconfirm dunst

# Font
sudo pacman -S --noconfirm otf-fira-code

# Qt use GTK theme
sudo pacman -S --noconfirm qt5-styleplugins

# Hotkeys
sudo pacman -S --noconfirm sxhkd

# Zathura
sudo pacman -S --noconfirm zathura
sudo pacman -S --noconfirm zathura-pdf-mupdf
sudo pacman -S --noconfirm zathura-pdf-poppler
sudo pacman -S --noconfirm zathura-pdf-djvu

# Hide mouse loading
sudo pacman -S --noconfirm unclutter

# Transperancy
sudo pacman -S --noconfirm xcompmgr

# Clipboard command line
sudo pacman -S --noconfirm xclip

# Window manipulation in i3
sudo pacman -S --noconfirm xdotool

# Sound
sudo pacman -S --noconfirm pactl
sudo pacman -S --noconfirm pavucontrol

# unzip
sudo pacman -S --noconfirm unzip

# unzip
sudo pacman -S --noconfirm arandr

# Install st
git clone https://github.com/LukeSmithxyz/st
cd st
sudo make install

# Neofetch remove
sudo pacman -Rs --noconfirm neofetch
sudo pacman -Rs --noconfirm arcolinux-neofetch-git
rm -r $HOME/neofetch

# Yandex-Disk
yaourt -S --noconfirm yandex-disk

# lf
yaourt -S --noconfirm lf

# dmenu
yaourt -S --noconfirm dmenu2

# Zoterao
yaourt -S --noconfirm zotero
yaourt -S --noconfirm bibtool

# Install pip
sudo pacman -S --noconfirm python-pip
sudo pacman -S --noconfirm gcc-fortran
sudo pacman -S --noconfirm imagemagick
sudo pacman -S --noconfirm tk
sudo pip install ipython
sudo pip install pandas
sudo pip install numpy
sudo pip install matplotlib
sudo pip install autopep8

yaourt -S --noconfirm zoom
sudo pacman -S --noconfirm pcmanfm

yaourt -S --noconfirm python-arxiv2bib
yaourt -S --noconfirm python-bibtexparser
yaourt -S --noconfirm python-doi
yaourt -S --noconfirm python-filetype
yaourt -S --noconfirm python-habanero
yaourt -S --noconfirm python-isbnlib
yaourt -S --noconfirm python-pylibgen


sudo pacman -S --noconfirm xprintidle
sudo pacman -S --noconfirm pandoc
sudo pacman -S --noconfirm pandoc-citeproc
sudo pacman -S --noconfirm pandoc-crossref
sudo pacman -S --noconfirm texlive-core
sudo pacman -S --noconfirm nodejs

# Imagemagick Dependencies
yaourt -S --noconfirm pstoedit-nomagick
yaourt -S --noconfirm autotrace-nomagick
yaourt -S --noconfirm flif
yaourt -S --noconfirm libfpx
yaourt -S --noconfirm libumem-git
yaourt -S --noconfirm brunsli

yaourt -S --noconfirm brave-nightly
yaourt -S --noconfirm chromium

yaourt -S --noconfirm mimeo
yaourt -S --noconfirm vidir
yaourt -S --noconfirm onedrive-abraunegg

sudo pacman -S --noconfirm ripgrep

yaourt -S --noconfirm nodejs-live-server

R -e 'install.packages("languageserver")'
R -e 'install.packages("tidyverse")'
R -e 'install.packages("kableExtra")'
R -e 'install.packages("styler")'
R -e 'install.packages("lintr")'
R -e 'install.packages("devtools")'
R -e 'install.packages("prettydoc")'

sudo pacman -S --noconfirm vlc
sudo pacman -S --noconfirm mpv
sudo pacman -S --noconfirm qbittorrent
yaourt -S --noconfirm electron4-bin
yaourt -S --noconfirm dingtalk-electron

# archlinuxcn

# tzupdate

sudo pacman -S --noconfirm blueman
sudo pacman -S --noconfirm fcitx
sudo pacman -S --noconfirm fcitx-configtool
sudo pacman -S --noconfirm fcitx-googlepinyin
sudo pacman -S --noconfirm freedownloadmanager

# vpn
sudo pacman -S --noconfirm v2ray
git clone https://github.com/iochen/v2gen/ && cd v2gen
env GOPRIVATE=github.com/v2ray/v2ray-core go build ./cmd/v2gen

