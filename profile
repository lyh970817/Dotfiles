# Adds `~/.local/bin` to $PATH
export PATH="$PATH:"$HOME/.local/bin/""
export PATH="$PATH:"$HOME/.local/share/""
export PATH="$PATH:"$HOME/.config/nvim/plugged/zotcite/python3""
# Default programs:
export VISUAL="nvim"
export EDITOR=$VISUAL
export TERMINAL="st"
export READER="zathura"
export BROWSER="brave-nightly"
export FILE="lf"
export ARSETUP="$HOME/.dotfiles"
export HIE_HOOGLE_DATABASE="$HOME/.hoogle/default-haskell-5.0.17.hoo"

export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export INPUTRC="$HOME/.config/inputrc"
export ZDOTDIR="$HOME/.config/zsh"


export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

# export GTK_IM_MODULE DEFAULT=fcitx
# export QT_IM_MODULE  DEFAULT=fcitx
# export XMODIFIERS    DEFAULT=@im=fcitx

# Commit setup

git -C $ARSETUP add \* && git -C $ARSETUP commit -m "start-up commit" && git -C $ARSETUP push

# Autostart X
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

