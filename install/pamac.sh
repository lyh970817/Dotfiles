sudo pacman -S --needed --noconfirm base-devel git wget yajl
cd /tmp
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si && cd /tmp/
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si
yaourt -S --noconfirm pamac-aur