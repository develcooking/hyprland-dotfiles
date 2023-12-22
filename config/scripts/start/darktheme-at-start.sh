#!/bin/bash
#set adwaita theme in qt apps
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

gsettings set org.gnome.desktop.wm.preferences theme adwaita-dark

#flatpak 
sudo flatpak override --env GTK_THEME=Adwaita-dark

#set dark mode as prefered default
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
#set adwaita dark as gtk theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
