

Это простой скрипт на zenity, который умеет отчищать вашу систему на linux (deb) в один клик,
а так же показывает данные по железу: температуры, напряжение и даже скорость куллеров,
плюс к этому можно "бустить" запускаемые приложения используя gamemode ...

В основе лежат утилиты Bleachbit, sweeper, aptitude, sensors, gamemode.

Устанавливается: sudo apt install git -y && git clone https://github.com/leohab75/SysClean.git && cd SysClean/ && sh install.sh

Удалить его можно также запустив скрипт cd SysClean/ && sh install.sh