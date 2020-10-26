#! /bin/bash
#Включение отладки bash:
set -x
#Установка обновлений:
yum -y update
#Установка Midnight Commander:
yum -y install mc
#Включение подсветки синтаксиса
cp -y /usr/share/mc/syntax/sh.syntax /usr/share/mc/syntax/unknown.syntax
#Установка net-tools
yum -y install net-tools
#Установка bind-utils
yum -y install bind-utils
#Отключить SELinux
# mcedit /etc/sysconfig/selinux
#SELINUX=enforcing заменить на SELINUX=disabled
# Копирование оригинального файла в .bak
cp /etc/sysconfig/selinux /etc/sysconfig/selinux.bak
# Замена строки и пересохранение с исходным расширением
sed 's!SELINUX=enforcing!SELINUX=disabled!' /etc/sysconfig/selinux.bak > /etc/sysconfig/selinux
# Остановка и Отключение FireWall
systemctl stop firewalld
systemctl disable firewalld
# Отключаем флуд сообщений
# Создаем файл с следующим содержимым
echo -e 'if $programname == "systemd" and ($msg contains "Starting Session" or $msg contains "Started Session" or $msg contains "Created slice" or $msg contains "Starting user-" or $msg contains "Starting User Slice of" or $msg contains "Removed session" or $msg contains "Removed slice User Slice of" or $msg contains "Stopping User Slice of") then stop' > /etc/rsyslog.d/ignore-systemd-session-slice.conf
# Перезагружаем службу
systemctl restart rsyslog
# Устанавливаем репозиторий
yum -y install epel-release
# Устанавливаем утилиту "Мониторинг системной командной строки" - iftop
yum -y install iftop
# Устанавливаем утилиту "Монитор процессов" - htop
yum -y install htop
# Устанавливаем утилиту "Монитор производительности" - atop
yum -y install atop
# Устанавливаем утилиту "Мониторинг работы процессов с дисками" - iotop
yum -y install iotop
# Устанавливаем утилиту Lsof
yum -y install lso
# Устанавливаем утилиту "Загрузка файлов по сети" - Wget
yum -y install wget
# Устанавливаем утилиту "Определение маршрутов следования данных в сетях TCP/IP" - traceroute
yum -y install traceroute
# Если будет необходимость добавить "Настройка системной почты" - https://serveradmin.ru/centos-nastroyka-servera/
