#!/bin/bash

if [ ! -f /usr/bin/asClean.sh ]; then

    cp -rv ./ /tmp/SysClean
    pkexec bash /tmp/SysClean/dependencies.sh
    rm -rfv /tmp/SysClean
else

    cclean="/usr/share/pixmaps/SysClean/ccleaner.png"

    zenity --window-icon=$cclean --question --text="Удалить с ПК ?" --height=100 --width=300

        if [ $? = 0 ]; then

        appdel=$(zenity --window-icon=$cclean --list --column="Удалить"\
        --separator=" " --multiple --title="UnAsClean" --text="Выберите программы для удаления: ctrl+ " \
        "bleachbit" "sweeper" "lm-sensors" "zenity" "gamemode" --height=300)

        touch /tmp/appdel
        echo $appdel >> /tmp/appdel


        pkexec bash /etc/init.d/UnSysClean

        rm -v /tmp/appdel 
        fi
fi   


exit 0;


