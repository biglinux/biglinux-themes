#!/bin/bash

OIFS=$IFS
IFS=$'\n'

folder="/usr/share/biglinux/themes"



case "$1" in

    --apply)
	#Confere se o arquivo, diretório, link, ou arquivo especial NÃO existe
    if [ -e "$folder/$2" ]; then
        cp -Rf $folder/$2/. "$HOME"
        echo "$2" > "$HOME/.big_desktop_theme"
        if [ "$XDG_CURRENT_DESKTOP" = "LXQt" ]; then
            openbox --restart
	    pcmanfm-qt --desktop-off
            cd $HOME
            pcmanfm-qt --desktop --profile=lxqt &
            exit
        fi
   else
        echo "Theme not found."
    fi
    exit
    ;;

    --list)
	for i  in  $(ls $folder); do
        echo "$i"
    done
	exit
    ;;

    *)
	echo " Usage:
	--list
	--apply name-of-theme"
	exit
    ;;

esac



IFS=$OIFS
