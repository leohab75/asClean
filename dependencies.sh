#!/bin/bash

#установка программ

apt update
apt install wget aptitude sweeper xterm lm-sensors zenity gamemode -y

if [[ ! -n $(dpkg -l | grep -i bleachbit) ]]; then

    wget https://download.opensuse.org/repositories/home:/andrew_z/xUbuntu_21.04/all/bleachbit_4.2.0-0_all.deb
    dpkg -i bleachbit_4.2.0-0_all.deb
    rm -f bleachbit_4.2.0-0_all.deb
fi

#определение оборудования
yes | sensors-detect

#управление утилитой
cp /tmp/SysClean/SysClean /usr/bin/

#удаление утилиты
cp /tmp/SysClean/UnSysClean /etc/init.d/

#чистка от рута
cp /tmp/SysClean/SysCleanRoot /etc/init.d/

#иконки
mkdir /usr/share/pixmaps/SysClean
cp -rv /tmp/SysClean/ico/* /usr/share/pixmaps/SysClean/
cp /tmp/SysClean/SysClean.desktop /usr/share/applications/

#обновление меню приложений
update-desktop-database
update-icon-caches /usr/share/pixmaps/*

#инициализация файлов
chmod +x /usr/bin/SysClean
chmod +x /etc/init.d/SysCleanRoot
chmod +x /etc/init.d/UnSysClean
chmod +x /usr/share/applications/SysClean.desktop

exit 0
