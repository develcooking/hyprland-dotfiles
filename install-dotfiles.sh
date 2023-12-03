#!/usr/bin/bash

func_printpipe() {
    echo '  |  '
}

func_printseparator() {
    echo ''
    echo ' [+]  --------------------------------------------'
    echo ' [+]            Original writen by end-4          '
    echo ' [+]  --------------------------------------------'
    echo ''
    echo 'this script isnt maintained anymore'
}

func_home_install() {
    if [ "$1" == "" ]; then
        return  # Do not wipe home folder
    fi
    func_printpipe
    echo ' [>_] rm -rf '"${HOME:?}/${1:?}"
    rm -rf "${HOME:?}/${1:?}"
    echo ' [>_] cp -r '"./${1:?}" "${HOME:?}/${1:?}"
    cp -r "./${1:?}" "${HOME:?}/${1:?}"
    func_printpipe
}
func_welcome() {
    echo ' [i]  WARNING: Run this script IN ITS FOLDER, or it will not work!'
    func_printseparator
    echo ' [i]  Using install scripts might mess up your setup without'
    echo '      proper understanding.'
    echo '      However, if you wish, we will proceed.'
    echo ' [i]  I'\''ll create a backup of your .config folder'
    echo '      and will let you select what to copy from these dotfiles.'
    echo '      Every command used will be shown.'
    func_printseparator
    echo -n ' [?]  Shall we begin? [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        echo " [i]  Let's go."
        func_printseparator
    else
        printf " [i]  Aborted.\n"
        exit 0
    fi
}

func_backup() {
    echo ' [?]  We will now backup your .config folder. '
    echo '  |   Hit Enter to proceed.'
    echo '  +-  Else, type "I understand the risk of not backing up."'
    echo -n ' [>>>]  '
    read -r userInput
    if [ "$userInput" == "I understand the risk of not backing up." ]; then
        echo ' [i]  Got it. You understand the risk of having no backup and will not backup.'
    else
        echo ' [i]  Alright.'
        echo ' [>_] cp -r "$HOME/.config" "$HOME/.config_BACKUP"'
        cp -r "$HOME/.config" "$HOME/.config_BACKUP"
        echo ' [i]  Backup done.'
    fi
    func_printseparator
}
func_install_config() {
    echo ' [?]  Install waybar config? '
    echo '      This is for the bar. '
    echo -n '      [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        func_home_install ".config/waybar/"
    else
        printf " [i]  Skipping waybar config installation.\n"
    fi
    

    echo ' [?]  Install Hyprland config?'
    echo -n '      [A]ll/[n]one '
    read -r userInput
    if [ "$userInput" == "A" ] || [ "$userInput" == "a" ] || [ "$userInput" == "" ]; then
        func_home_install ".config/hypr/"
    else
        if [[ "$userInput" == "N" ]] || [[ "$userInput" == "n" ]]; then
            printf " [-]  Skipping Hyprland config installation.\n"
        fi
    fi


    echo -n ' [?]  Install scripts config? This are may scripts recommended to install for Hyprland [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        func_home_install ".config/scripts/"
    else
        printf " [-]  Skipping scripts config installation.\n"
    fi


    echo -n ' [?]  Install dunst config? This is for notification style [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        func_home_install ".config/dunst/"
    else
        printf " [-]  Skipping dunst config installation.\n"
    fi

    
    echo -n ' [?]  Install swaylock config? This is locking your pc [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        func_home_install ".config/swaylock/"
    else
        printf " [-]  Skipping swaylock config installation.\n"
    fi


    echo -n ' [?]  Install rofi config? This is for all the rofi scripts [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        func_home_install ".config/rofi/"
    else
        printf " [-]  Skipping rofi config installation.\n"
    fi


    echo -n ' [?]  Install xfce4 config? This is for thunar [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        func_home_install ".config/xfce4/"
    else
	printf " [-]  Skipping xfce4(thunar) config installation.\n"
    fi

    
    echo -n ' [?]  Install mimeapps.list? This definse your default applications [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        func_home_install ".config/xfce4/"
    else
	printf " [-]  Skipping installation of mimeapps.list .\n"
    fi



    echo -n ' [?]  Install backgrounds? This is makes your first navigations easy [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        func_home_install ".config/backgrouds/"
    else
	printf " [-]  Skipping installation of backgrounds.\n"
    fi
    echo -n ' [?]  Install .bashrc? This is for terminal [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        func_home_install ".bashrc"
    else
        printf " [-]  Skipping .bashrc installation.\n"
    fi


    echo -n ' [?]  Install neofetch config? This your neofetch style [Y/n] '
    read -r userInput
    if [ "$userInput" == "y" ] || [ "$userInput" == "Y" ] || [ "$userInput" == "" ]; then
        func_home_install ".config/neofetch/"
    else
        printf " [-]  Skipping neofetch config installation.\n"
    fi
}

