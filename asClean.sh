#!/bin/bash

icon="/usr/share/pixmaps/asClean/rating.png"
sensors="/usr/share/pixmaps/asClean/sensors.png"
cclean="/usr/share/pixmaps/asClean/ccleaner.png"
gamemode="/usr/share/pixmaps/asClean/render-setup.png"

function Delete() {
zenity --window-icon="$cclean" --question --text="удалить старые файлы ?" --title "DELETE" --height=200 --width=400 

    if [ $? == 0 ]; then
    rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
    bleachbit --list-cleaners  >> cleaners.list
    sed -i '/system.free_disk_space/d'  cleaners.list
    bleachbit -c $(cat cleaners.list)
    sweeper --automatic

        #от рута
        zenity --window-icon="$cclean" --question --text="Отчистить от Суперпользователя?" --title "DELETE ROOT" --height=200 --width=400
            if [ $? == 0 ]; then
            pkexec /etc/init.d/AsClean
            fi
    fi
}

function Sensors() {

    cpu_temp=$( sensors )
    zenity --info --window-icon="$sensors" --text="Система: $cpu_temp"  —-title="Показания датчиков" --height=200 --width=400
}

function Gamemode() {

    prog=$(zenity --window-icon="$gamemode" --entry --title="Gamemoderun" --text="Укажите название программы" --height=200 --width=400 )

    if [ -n $prog ]; then
    gamemoderun $prog || zenity --window-icon="$gamemode" --error --text="Такого приложения не найдено" --height=200 --width=400
    fi
}

while true ;
do
    choice=$( zenity --window-icon="$icon" --list --imagelist  --width=650 --height=300 --column="Name" --column="Category" --text="" \
    "$cclean" "Удалить журналы, архивы, остатки файлов конфигураций, кеши и т.д."\
    "$sensors" "Отобразить показания датчиков: температуру и т.д."\
    "$gamemode" "Запустить программу в режиме \"Gamemode\" " )

    case "$choice" in
    
    $cclean ) Delete ;;
    $sensors ) Sensors ;;
    $gamemode )  Gamemode ;;
    *) break ;;

    esac

done

exit 0;