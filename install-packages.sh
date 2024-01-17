#!/usr/bin/bash

func_printpipe() {
    echo '  |  '
}

func_printseparator() {
    echo ''
    echo ' [+]  --------------------------------------------'
    echo ' [+]            writen by develcooking          '
    echo ' [+]  --------------------------------------------'
    echo ''
    echo 'this script is used to install all needed packages'
    echo 'this script is currently experimental'

}

func_install_aur_helper() {
    echo -n ' [?]  Do you want to install paru or yay? [p/y] Default paru'
    read -r userInput
    if [ "$userInput" == "p" ] || [ "$userInput" == "P" ] || [ "$userInput" == "" ]; then

		# installing paru


        echo "[?] So you want to install paru?"
		read -r userInput
		 if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ]then
		        echo ' [>_] installing paru'


			sudo pacman -S --needed base-devel
			git clone https://aur.archlinux.org/paru.git
			cd paru
			makepkg -si
			paru = $aur_helper
		else
		printf " [i]  Aborted.\n"
	    exit 0


		#installing yay
        
	elif ["$userInput" == "y" ] || [ "$userInput" == "Y" ] 
		        echo ' [>_] installing yay'

		pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si


    else
        printf " [i]  Aborted.\n"
        exit 0
    fi
}

func_install_needed_dependencies(){

echo'[?] are you ready to install the needed dependencys like waybar, hyprland,rofi etc. ? (Y/n)'
	read -r userInput
		 if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ]then
			$aur_helper -S kitty hyprland-git papirus-icon-theme networkmanager swaylock-effects-git networkmanager-dmenu-git dbus waybar swayidle playerctl swaync swww hyprshot ttf-jetbrains-mono-nerd swayosd-git rofi-lbonn-wayland rofi-bluetooth-git wlsunset-git cliphist rofimoji pulsemixer

 else
        printf " [i]  Aborted.\n"
        exit 0
    fi
}


func_on_laptop(){
echo'[?] are you on a laptop and want to install some optional dependencys like brightnessctl etc. ? (Y/n)'
	read -r userInput
		 if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ]then
			$aur_helper -S brightnessctl 

 else
        printf " [i]  Aborted.\n"
        exit 0
    fi
}

func_install_other_packages(){

echo'[?] some packages are needed for others this step insures that all things are present. This includes things like pipewire and portals'
echo'Would you like to install these packages? (Y/n)'
	read -r userInput
		 if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ]then
			$aur_helper -S pipewire pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse wireplumber xdg-desktop-portal-hyprland-git xdg-desktop-portal-gtk xdg-desktop-portal

 else
        printf " [i]  Aborted.\n"
        exit 0
    fi
}

func_install_loved_packages(){

	echo'[?] Would you like to install my loved packages like thunar, thunderbird, neovim, librewolf, xwaylandvideobridge? (Y/n)'
	read -r userInput
		 if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ]then
			$aur_helper -S librewolf-bin neovim thunderbird thunar thunar-archive-plugin thunar-volman tumbler ffmpegthumbnailer gvfs xwaylandvideobridge-bin

		else
        printf " [i]  Aborted.\n"
        exit 0
    fi
}

func_installation_done(){
echo''
echo''
echo''
echo''
echo''
echo''
echo''
echo'[i] you succssfully compleded this installation'
echo'[i] I would recomment to you now ti install the configuration with the install-dotfiless.sh script'
}
