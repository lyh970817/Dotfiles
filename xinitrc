!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

dunst &
sxhkd &
xcompmgr &
unclutter &
yandex-disk start &
ibus-daemon -drx &
onedrive --syncdir ~/Yandex.Disk/Project/Research/GLAD/Papers --monitor &
if [[ $(iseink) -eq 1 ]];then
    eink &
else
    laptop &
fi
exec i3
