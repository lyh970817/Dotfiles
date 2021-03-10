# sh ~/.dotfiles/install/pamac.sh

pacman=$(sed /#/d pacman.txt|awk 'NF')
yaourt=$(sed /#/d yaourt.txt|awk 'NF')

# for f in $pacman;
# do
#     sudo pacman -S --noconfirm $f
# done

for f in $yaourt;
do
    yaourt -S --noconfirm $f
done

