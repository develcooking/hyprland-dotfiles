#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias nv='nvim'
alias vi='nvim'
alias nano='nvim'
alias pm='pulsemixer'
alias revdeppa='paru -Rsn $(paru -Qdtq)'
alias icat='kitty +kitten icat'
alias updateven='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias neofetch='neowofetch'

export QT_QPA_PLATFORMTHEME=xdg-desktop-portal-gtk
export QT_QPA_PLATFORMTHEME=gtk3
export TERM="kitty"
export TERMINAL="kitty"
export GTK_THEME=Adwaita-dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc

export PATH=$PATH:/home/jp/.spicetify
